//===============================================================================================================//
// Class: OpportunityAllTriggerHandler
// Description: Handler class for Opportunity called from Opportunity Trigger
// Related: OpportunityAllTriggerHandlerTest, OpportunityAllTriggerHelper

//=========================================Revision History=====================================================


public class OpportunityAllTriggerHandler{
    
    
    //this method is called from opportunity trigger and all the logic for before delete goes here
    public static void processOpportunitiesBeforeDelete(List<Opportunity> oldOpportunities){
        
       
        preventOpportunityDelete(oldOpportunities);
        
    
    }
    
    //US-001 to prevent opportunity delete for non admins
    private static void preventOpportunityDelete(List<Opportunity> oldOpportunities){
        
        
        String currentUserProfileName=[Select Id,Name from Profile where Id=:userinfo.getProfileId()].Name;
        for(Opportunity oldOppty: oldOpportunities){

            if(currentUserProfileName == 'System Administrator' && oldOppty.Probability >= 0.75){
                //good to store the verbiage in custom label
                oldOppty.addError('Non Admin: Opportunity cannot be deleted if probability greater than equals to 75%');
            }  
        
        }
        
    }
    
}