/* fileUploadController2.js is identical */
({  
    save : function(component, event, helper) {
        helper.save(component);
    },
    
    waiting: function(component, event, helper) {
    	$A.util.addClass(component.find("uploading").getElement(), "uploading");
    	$A.util.removeClass(component.find("uploading").getElement(), "notUploading");
    },
    
    doneWaiting: function(component, event, helper) {
    	$A.util.removeClass(component.find("uploading").getElement(), "uploading");
    	$A.util.addClass(component.find("uploading").getElement(), "notUploading");
    },
    
    
    doInit: function(component){
    	var action = component.get("c.getAttachmentList");
        action.setParams({
            parentId: component.get("v.parentId"), 
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.AttachmentFiles", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
    },
    
    callUpdateRecord: function(component, event, helper){
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
        
    }
  	
})