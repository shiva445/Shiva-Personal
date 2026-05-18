global class CreateObjectFromEmail implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env) {
 
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        
        String subject = email.subject.trim().toLowerCase();
        sObject[] newObjects = new sObject[0];
        sObject newObject;
        
        sObjectType sot;
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        sot = gd.get('Task');
        newObject = sot.newSObject();
        newObjects.add(newObject);
		
        // Search [...]={...} strings in the email body using regex
        Matcher myMatcher = Pattern.compile('\\[[^\\]]*\\]=\\{[^\\}]*\\}').matcher(email.plainTextBody);
        Id CaseId;
        while (myMatcher.find()) {
            String myMatch = myMatcher.group(0);
            // Get the field name
            string fieldName = myMatch.substring(1);
            fieldName = fieldName.substring(0, fieldName.indexOf(']'));
            
            // Get the field value
            string fieldValue = myMatch.substring(myMatch.indexOf('{') + 1);
            fieldValue = fieldValue.substring(0, fieldValue.indexOf('}'));
            // Try to set it
            if(fieldName == 'CaseNumber'){
                system.debug('case number is '+fieldValue);
                CaseId = [select id,CaseNumber from Case where CaseNumber=:fieldValue].Id;
                newObject.put('whatId', CaseId );  
                newObject.put('Priority','Normal');
                newObject.put('Subject',subject);
                newObject.put('description',email.plainTextBody);
                break;
            }
            
        }
        system.debug(newObject);
        // Try and insert the new object
        try {
            insert newObjects;
        }
        catch (Exception ex) {
            result.message = 'Insert problem: ' + ex;
            result.success = false;
            system.debug(Logginglevel.ERROR,'Exception is '+ex.getMessage());
            return result;
        }
		
        
        //hanlde inbound attachments
        if(email.binaryAttachments!=null){
            
            for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                Attachment attachment = new Attachment();
                attachment.Name = bAttachment.fileName;
                attachment.Body = bAttachment.body;
                attachment.ParentId = CaseId;
                insert attachment;
            }
        }
        
        
        result.success = true;
        return result;
     
    }
    
    static testMethod void testHandleInboundEmail() {

        List<ObjectFromEmailDefaultFields__c> ds = new List<ObjectFromEmailDefaultFields__c>();
        ObjectFromEmailDefaultFields__c d1 = new ObjectFromEmailDefaultFields__c();
        d1.Name = 'd1';
        d1.Object_Name__c = 'Contact';
        d1.Field_Name__c = 'Email';
        d1.Default_Value_Text__c = 'lucian@vertiba.com';
        ds.add(d1);
        ObjectFromEmailDefaultFields__c d2 = new ObjectFromEmailDefaultFields__c();
        d2.Name = 'd2';
        d2.Object_Name__c = 'Contact';
        d2.Field_Name__c = 'DoNotCall';
        d2.Default_Value_Checkbox__c = true;
        ds.add(d2);
        ObjectFromEmailDefaultFields__c d3 = new ObjectFromEmailDefaultFields__c();
        d3.Name = 'd3';
        d3.Object_Name__c = 'Contact';
        d3.Field_Name__c = 'Birthdate';
        d3.Default_Value_Date__c = Date.newInstance(2010, 10, 11);
        ds.add(d3);
        insert ds;

        List<ObjectFromEmailAcceptedFields__c> acs = new List<ObjectFromEmailAcceptedFields__c>();
        ObjectFromEmailAcceptedFields__c ac1 = new ObjectFromEmailAcceptedFields__c();
        ac1.Name = 'ac1';
        ac1.Object_Name__c = 'Contact';
        ac1.Field_Name__c = 'Department';
        acs.add(ac1);
        ObjectFromEmailAcceptedFields__c ac2 = new ObjectFromEmailAcceptedFields__c();
        ac2.Name = 'ac2';
        ac2.Object_Name__c = 'Contact';
        ac2.Field_Name__c = 'FirstName';
        acs.add(ac2);
        ObjectFromEmailAcceptedFields__c ac3 = new ObjectFromEmailAcceptedFields__c();
        ac3.Name = 'ac3';
        ac3.Object_Name__c = 'Contact';
        ac3.Field_Name__c = 'LastName';
        acs.add(ac3);
        insert acs;
  
        Messaging.inboundEmail email = new Messaging.inboundEmail();
        email.subject = 'New Contact';
        String tempSubj = 'Lucian ' + DateTime.now().format() + ' - 1';
        email.plainTextBody = '[Department]={' + tempSubj + '}';
        email.plainTextBody += ', [HomePhone]={MyHomePhone}';
        email.plainTextBody += ', [FirstName]={MyFName}';
        email.plainTextBody += ', [LastName]={MyLName}';
        System.Debug('Text body: ' + email.plainTextBody);
      
        CreateObjectFromEmail csee = new CreateObjectFromEmail();
      
        test.startTest();
        
        Messaging.InboundEmailResult result = csee.handleInboundEmail(email, null);
        
        test.stopTest();
      
        System.assert(result.success);
        
        Contact newCnt = [SELECT Id, Email, DoNotCall, Birthdate, Department, HomePhone FROM Contact WHERE Department = :tempSubj];
        
        System.assertEquals('lucian@vertiba.com', newCnt.Email);
        System.assertEquals(true, newCnt.DoNotCall);
        System.assertEquals(Date.newInstance(2010, 10, 11), newCnt.Birthdate);
        System.assertEquals(null, newCnt.HomePhone);
        System.assertEquals(tempSubj, newCnt.Department);
    }
    
}