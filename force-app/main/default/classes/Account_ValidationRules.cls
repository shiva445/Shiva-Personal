public class Account_ValidationRules implements ValidationRulesInterface{
	
    
    public static void runValidations(){
        
        //generic validation rules
        industryLengthValidation();
        
        
        //country specific validations
        
        
    }
    
    
    public static void industryLengthValidation(){
        for(Account acc: (List<Account>)trigger.new){
            system.debug('In industry');
            if(String.isNotBlank(acc.Industry) && String.valueof(acc.Industry).length()>6){
                acc.Industry.adderror('Industry can not be over 6 chars');
            }
            
        }
    }
}