global class ScheduledClassTest implements Schedulable {
	global String leadId;
    global static Boolean fromScheduledClass=false;
    global ScheduledClassTest(String lId){ 
        leadId=lId;
        
    }
    global void execute(SchedulableContext SC) {
    	system.debug('Lead Id is '+leadId);
        Lead l = new Lead();
        l.Id=leadId;
        l.Description = 'updated from sch class';
        fromScheduledClass=true;
        update l;
        
        
        CronTrigger ct = [SELECT id,TimesTriggered, NextFireTime,CronJobDetailId FROM CronTrigger WHERE Id = :sc.getTriggerId()];
        System.abortJob(ct.id);
        
         
    }
    /*
    global void finish(Database.BatchableContext BC)
    {
        // Get the ID of the AsyncApexJob representing this batch job from Database.BatchableContext.
        // Query the AsyncApexJob object to retrieve the current job's information.
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email ..... FROM AsyncApexJob WHERE Id = 
        :BC.getJobId()];
        
        //then use the active job id and abort it
        system.abortJob(a.id);
    }*/
    
}