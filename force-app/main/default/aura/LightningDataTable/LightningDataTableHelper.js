({
    getDataHelper : function(component, event) {
        var action = component.get("c.getAccRecords");
        //Set the Object parameters and Field Set name
        action.setParams({
            strObjectName : 'Account',
            strFieldSetName : 'DataTableFieldSet'
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set("v.mycolumns", response.getReturnValue().lstDataTableColumns);
                component.set("v.mydata", response.getReturnValue().lstDataTableData);    
            }else if (state === 'ERROR'){
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }else{
                console.log('Something went wrong, Please check with your admin');
            }
        });
        $A.enqueueAction(action);	
    },
    showToastMessage : function(type,title, message) 
    {
        var toastEvent = $A.get("e.force:showToast");
        if (toastEvent)
        {
            toastEvent.setParams({
                "title": title,
                "type": type,
                "message": message,
            });
            toastEvent.fire();
        }
    },
    sortData: function (component, fieldName, sortDirection) {
         var data = component.get("v.mydata");
         var reverse = sortDirection !== 'asc';
         //sorts the rows based on the column header that's clicked
         data.sort(this.sortBy(fieldName, reverse))
         component.set("v.mydata", data);
    },
 	sortBy: function (field, reverse, primer) {
         var key = primer ? function(x) {return primer(x[field])} : function(x) {return x[field]};
         //checks if the two rows should switch places
         reverse = !reverse ? 1 : -1;
         return function (a, b) {
             return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
         }
 	}
})