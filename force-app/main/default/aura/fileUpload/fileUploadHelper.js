({
    MAX_FILE_SIZE: 750000, 

    save : function(component) {
        var fileInput = component.find("file").getElement();
    	var file = fileInput.files[0];
        console.log('in the save helper'+file.size);
        if (file.size > this.MAX_FILE_SIZE) {
            alert('File size cannot exceed ' + this.MAX_FILE_SIZE + ' bytes.\n' +
    		  'Selected file size: ' + file.size);
    	    return;
        }
    
        var fr = new FileReader();
        
        var self = this;
        
        fr.onload = $A.getCallback(function() {
            var fileContents = fr.result;
            var base64Mark = 'base64,';
            var dataStart = fileContents.indexOf(base64Mark) + base64Mark.length;
            
            fileContents = fileContents.substring(dataStart);
            
            self.upload(component, file, fileContents);
        });
    
        fr.readAsDataURL(file);
    },
            
    upload: function(component, file, fileContents) {
        var action = component.get("c.saveTheFile"); 
        console.log('in the upload');
        action.setParams({
            parentId: component.get("v.parentId"),
            fileName: file.name,
            base64Data: encodeURIComponent(fileContents), 
            contentType: file.type
        });
        
        action.setCallback(this, function(a) {
            var attachId = a.getReturnValue();
            console.log('attachment id is '+attachId);
            
        });
        
        $A.enqueueAction(action);
        component.RefreshAttachments();
    }
})