public without sharing class FileUploaderChunkBitBucket {
    @AuraEnabled
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {        
        
        return FileService.saveChunk(parentId, fileName, base64Data, contentType, fileId,false) ;
    }    
}