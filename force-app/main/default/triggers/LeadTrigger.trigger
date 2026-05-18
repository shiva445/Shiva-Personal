trigger LeadTrigger on Lead (before update) {
	
    for(Lead l: trigger.new){
        
        if(ScheduledClassTest.fromScheduledClass==false){
            l.description='sch class is scheduled after 5 mins';
            String hour = String.valueOf(Datetime.now().hour());
            String min = String.valueOf(Datetime.now().minute() + 2); 
            String ss = String.valueOf(Datetime.now().second());
            
            //parse to cron expression
            String nextFireTime = ss + ' ' + min + ' ' + hour + ' * * ?';
            
            ScheduledClassTest s = new ScheduledClassTest(l.id); 
            System.schedule('Lead Sync Started At ' + String.valueOf(Datetime.now()), nextFireTime, s);
        }
    }
    
}