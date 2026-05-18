({
     
    handleFilesChange: function(component, event, helper) {
        
        component.set("v.error", '');
        $A.util.addClass(component.find('errorDiv'),'slds-hide');
        if(component.find("fileId").get("v.validity").valid==false){
            component.find("fileId").showHelpMessageIfInvalid();
            return ;
        }
        var fileName;
        if (event.getSource().get("v.files").length > 1) {
            component.set("v.error", 'only 1 file is allowed');
            $A.util.removeClass(component.find('errorDiv'),'slds-hide');
            return ;
            
        }
        //debugger;
        if (event.getSource().get("v.files").length > 0) {
            var fileType = event.getSource().get("v.files")[0]['type'].split('/')[1];
            var allowedTypes=['jpg', 'gif', 'bmp', 'png', 'tif', 'pdf','docx'];
            
            //  Office files MIME types differ from their file extension name
            var officeExts = {
                "doc"  :"msword",
                "docx" :"vnd.openxmlformats-officedocument.wordprocessingml.document",
                "xls"  :"vnd.ms-excel",
                "xlsx" :"vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                "ppt"  :"vnd.ms-powerpoint",
                "pptx" :"vnd.openxmlformats-officedocument.presentationml.presentation"
            };
            
            for(var i=0;i<allowedTypes.length;i++){
                var allowedType = allowedTypes[i];
                if(officeExts.hasOwnProperty(allowedType)){
                    //  This is an office file, convert to MIME type
                    allowedType = officeExts[allowedType];
                }
                if(fileType == allowedType){
                    break;
                }
                if(i== allowedTypes.length-1){
                    component.set("v.error", 'file type is not allowed');
                    $A.util.removeClass(component.find('errorDiv'),'slds-hide');
                    return ;
                }
            }
            fileName = event.getSource().get("v.files")[0]['name'];
            helper.uploadHelper(component, event,fileName);
            
        }
    },
})