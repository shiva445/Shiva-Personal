({
    handleUploadFinished : function(component, event, helper) {
 		console.log("uploaded file is "+event.getParam("files"));
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
 
         var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": "File "+uploadedFiles[0].name+" Uploaded successfully."
    });
    toastEvent.fire();
 
    },
    validateAndContinue : function(component, event, helper) {
        if (event.getSource().get("v.files").length > 0) {
            var objFileReader = new FileReader();
            var fileName = event.getSource().get("v.files")[0]['name'];
            alert("FileName is "+fileName);
            objFileReader.onload = $A.getCallback(function() {
                
                var fileContents = objFileReader.result;
                alert("in call back"+fileContents);
            });
            objFileReader.readAsDataURL(event.getSource().get("v.files")[0]);
        }
    },
    handleSave: function(component,event, helper){
        console.log(component.find("inputDate").get("v.value"));
        
    },

})