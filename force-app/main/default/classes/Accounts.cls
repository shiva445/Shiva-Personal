public class Accounts extends fflib_SObjectDomain {
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    public void updateOpportunityActivity(fflib_SObjectUnitOfWork uow) {
        for(Account account : (List<Account>) Records) {
            account.Description = 'Last Opportunity Raised ' + System.today();
            uow.registerDirty(account);
        }
    }
}