public class contactListController {
    @AuraEnabled
    public static List<ContactWrapper> getAccountContacts(Id AccountId){
        List<ContactWrapper> conList=new List<ContactWrapper>();
        for(Contact con:[select id,Name,lastname,firstname, Description,title,lastmodifieddate from Contact where accountId=:accountId]){
            conList.add(new contactWrapper(con));
        }
        system.debug(conlist.size());
        return conList;
        
    }
    
    @AuraEnabled
    public static Contact cancelContactEdit(Id conId){
        
        return [select id,Name,lastname,firstname, Description,title from Contact where id=:conId];

    
    }
    
    
    @AuraEnabled
    public static void insertContact(Contact newCon){
        insert newCon;
    }
    
    public class ContactWrapper{
        @AuraEnabled public Contact con{get;set;}
        @AuraEnabled public Boolean EditMode{get;set;}
        
        
        public ContactWrapper(Contact conVar){
            con=conVar;
            EditMode=false;
        }
        
    }
}