({
	doInit: function(component){
    	var action = component.get("c.getAccountContacts");
        action.setParams({
            AccountId: component.get("v.parentId"), 
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("contact success");
                component.set("v.ContactFiles", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
    },
    createNewContact: function(component, event) {
        // get the contactList from component and add(push) New Object to List  
        var RowItemList = component.get("v.ContactFiles");
        RowItemList.push({
            'sobjectType': 'contactListController.ContactWrapper',
            'contact':null,
            'EditMode':'true'
            
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.ContactFiles", RowItemList);
    },
    rowEditable:function(component, event, helper){
        var AllRowsList = component.get("v.ContactFiles");
        var index = event.target.getAttribute("data-row-index");
        console.log('Index is '+index);
        console.log('Row mode is '+AllRowsList[index].EditMode);
        AllRowsList[index].EditMode=true;
        component.set("v.ContactFiles", AllRowsList);
    },
    callDeleteRecord: function(component, event, helper){
        var currentRecordId = event.target.id.substring(4);
        
        console.log("delete record id "+currentRecordId);
        var action = component.get("c.deleteAttachment");
        action.setParams({
            AttachmentId: currentRecordId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                //component.set("v.AttachmentFiles", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        component.RefreshAttachments();
        
    },
    
    deleteContactRow: function(component, event, helper) {
        // get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.target.getAttribute("data-row-index");
        console.log('index is '+index);
        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.ContactFiles");
        AllRowsList.splice(index, 1);
        // set the contactList after remove selected row element  
        component.set("v.ContactFiles", AllRowsList);
    },
    cancelContactRow: function(component, event, helper) {
        
        var index = event.target.getAttribute("data-row-index");
        console.log('Index is '+index);
        
        var AllRowsList = component.get("v.ContactFiles");
        console.log('contact id is '+AllRowsList[index].con.Id);
        var action=component.get("c.cancelContactEdit");
        action.setParams({
            conId: AllRowsList[index].con.Id,
            
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                //component.set("v.AttachmentFiles", response.getReturnValue());
                console.log('in response');
                var AllRowsList = component.get("v.ContactFiles");
                AllRowsList[index].EditMode=false;
                AllRowsList[index].con=response.getReturnValue();
                component.set("v.ContactFiles", AllRowsList);
            }
        });
        $A.enqueueAction(action);
        
        
    }
    
})