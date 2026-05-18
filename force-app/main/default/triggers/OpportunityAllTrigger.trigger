trigger OpportunityAllTrigger on Opportunity (before delete) {
    
    
    if(trigger.isBefore && trigger.isDelete){
        
        OpportunityAllTriggerHandler.processOpportunitiesBeforeDelete(trigger.old);
    
    }
    
    
    
}