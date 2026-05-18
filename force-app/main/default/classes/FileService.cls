public without sharing class FileService {
    public static list<string> getFiles(Id caseId){
        system.debug('###: start getFiles for CaseId '+caseId);
        set<Id>  ContentDocumentIdSet = new set<Id>();
        list<string> filedata = new list<string>();
        list<ContentDocumentLink> documentLinks=[SELECT ContentDocumentId,Id,IsDeleted,LinkedEntityId,ShareType,SystemModstamp,Visibility FROM ContentDocumentLink Where LinkedEntityId=:caseId];
        system.debug('###: # of ContentDocumentLinks '+documentLinks.size());
        for(ContentDocumentLink cl:documentLinks){
            ContentDocumentIdSet.add(cl.ContentDocumentId);
        }
        list<contentversion> contentversionList = [SELECT id, VersionData from contentversion 
                                                   WHERE contentdocumentId IN:ContentDocumentIdSet];
        system.debug('###: # of Content Versions '+ contentversionList.size());
        system.debug('###: begin processing content versions');
        for(contentversion cv:contentversionList){
            try{
                String fileDataString = EncodingUtil.base64Encode(cv.VersionData);
                if(fileDataString.length()<6000000) {
                    filedata.add(fileDataString);
                } else {
                    system.debug('###: fileDataListString exceeds maximum 6000000');
                }
            } catch(system.Exception ex){
                system.debug('Exception: '+ex.getMessage());
            }
        }
        string fileDataListString;
        try{
            fileDataListString = String.valueOf(filedata);
        } catch(system.Exception ex){
            system.debug('filedata to string Exception: '+ex.getMessage());
        }
        if(fileDataListString.length()<6000000){
            system.debug('fileDataListString'+fileDataListString);
        } else {
            system.debug('###: fileDataListString exceeds maximum 6000000');
        }
        
        return filedata;
    }
    
    public static Id saveChunk(string parentId, String fileName, String base64Data, String contentType, String fileId, boolean mobile) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks  
        system.debug('###: begin saveChunk');
        if (fileId == '') {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType, mobile);
        } else {
            fileId =appendToFile(fileId, base64Data, fileName, contentType);
        }
        Id contentDocumentId;
        if(fileId != ''){
            list<contentversion> cvList = new list<contentversion>();
            cvList = [SELECT id, contentdocumentId from contentversion WHERE id=:fileId];
            if(!cvList.isEmpty()){
                contentDocumentId = cvList[0].contentdocumentId;
            } else {
                system.debug('###: saveChunk cvList Empty');
            }
            //contentDocumentId = [SELECT id, contentdocumentId from contentversion WHERE id=:fileId].contentdocumentId;
            if(parentId != null && parentId!='' && contentDocumentId != null){
                updateFiles(parentId,contentDocumentId);
            } else {
                system.debug('###: saveChunk parentId or contentDocumentId Blank \r\nparentId: '+parentId + '\r\ncontentDocumentId: '+contentDocumentId);
            }
        } else {
            system.debug('###: saveChunk fileId Blank');
        }
        return contentDocumentId;
    }
    
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType,boolean mobile) {
        
        if(!mobile){
            base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        }
        ContentVersion cv = new ContentVersion();
        cv.ContentLocation = 'S';
        //cv.ContentDocumentId = contentDocumentId;
        cv.VersionData = EncodingUtil.base64Decode(base64Data);
        cv.Title = fileName;
        cv.PathOnClient = filename;
        Id cvId;
        try {
            insert cv;
            cvId = cv.Id;
        } catch(system.DmlException ex){
            system.debug('### Exception: '+ex.getMessage());
        }
        
        
        //***This DEBUG statement must return an Id for the rest of the code to work***
        //System.debug('contentDocumentId='+cv.ContentDocumentId);               
        
        //ContentDocumentLink cdl = new ContentDocumentLink();
        //cdl.ContentDocumentId = cv.ContentDocumentId;
        //cdl.LinkedEntityId = parentId;
        //cdl.ShareType = 'I';
        
        //insert cdl;
        
        return cvId;
        
        
    }
    public static string updateFiles(id caseId, id cdId){
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId =cdId;
        cdl.LinkedEntityId = caseId;
        cdl.ShareType = 'V';
        try{
            insert cdl;
            
        }
        catch(exception ex){
            system.debug('###: Exception: '+ex.getMessage());
            return 'Error:'+ ex.getMessage();
        }
        return'success';
    }
    
    private static Id appendToFile(Id fileId, String base64Data,  String fileName,  String contentType) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        ContentVersion cv2 = [
            SELECT Id, VersionData
            FROM ContentVersion
            WHERE contentdocumentID =: fileId
            ORDER BY createdDate desc
            LIMIT 1
        ];
        
        String existingBody = EncodingUtil.base64Encode(cv2.VersionData);
        ContentVersion cv = new ContentVersion();
        cv.ContentLocation = 'S';
        //cv.ContentDocumentId = fileId;
        cv.VersionData = EncodingUtil.base64Decode(base64Data);
        cv.Title = fileName;
        cv.PathOnClient = filename;        
        
        cv.VersionData = EncodingUtil.base64Decode(existingBody + base64Data);
        Id cvId;
        try {
            insert cv;
            cvId = cv.Id;
        } catch(system.DmlException ex){
            system.debug('###Exception: '+ex.getMessage());
        }
        
        return cvId;
    }
    
    /*@future
    public static void insertContentDocumentLink(string jsonstr){
        list<contentdocumentLink> cdlList = (list<contentdocumentLink>)JSON.deserialize(jsonstr, list<contentdocumentLink>.class);
        insert cdlList;
    }*/
}