global class SOAPWebServiceClass {
    webservice static String makeAccount(String AccDetails) {
       
        Account a = (Account)JSON.deserialize(AccDetails,Account.class);
        system.debug('Account is '+a);
        
        List<Account> accList = [select id from Account where AccountUniqueId__c =:a.AccountUniqueId__c];
        if(accList.size()>0){
            a.id=accList[0].id;
        }
        try{
            upsert a;
        }catch(exception ex){
            return ex.getMessage();
        }
        
        
        return 'Success';
    }
}