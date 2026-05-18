trigger AccountAllTrigger on Account (before update) {
    
    
    //Account_ValidationRules.runValidations();
    if(Trigger.isBefore && Trigger.isUpdate)
    for(Account acc: trigger.new){
        //acc.description = acc.Test_encryption__c;
    }
    
    
}