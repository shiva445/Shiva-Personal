({
    doInit : function(component, event, helper) {		                
        helper.getDataHelper(component, event);
    },
    handleSaveEdition: function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        console.log(draftValues);
        var action = cmp.get("c.updateAccount");
        action.setParams({"acc" : draftValues});
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            $A.get('e.force:refreshView').fire();
            helper.showToastMessage('Success','Success','Changes are saved');
            
        });
        $A.enqueueAction(action);
        
    },
    updateColumnSorting: function(component, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        // assign the latest attribute with the sorted column fieldName and sorted direction
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        
        helper.sortData(component, fieldName, sortDirection);
    }
})