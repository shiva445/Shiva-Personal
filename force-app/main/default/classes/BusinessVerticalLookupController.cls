public class BusinessVerticalLookupController {
	
    @AuraEnabled(cacheable=true)
    public static Map<Id, BusinessVertical> getBusinessVerticalsList() {

        Map<Id, BusinessVertical> objectMap = new Map<Id, BusinessVertical>();

        
        for (Account a : [select id,name,website from Account]) {

            

            BusinessVertical o = new BusinessVertical();
            o.name = a.name;
            o.website = a.website;
            o.reference = a.name + ' (' + a.website +')';
            objectMap.put(a.Id, o);
        }

        return objectMap;
    }

    public class BusinessVertical {
        @AuraEnabled public String name {get; set;} // Object API Name
        @AuraEnabled public String website {get; set;} // Object Label
        
        // reference will be the value displayed to the user. There can be objects with the same label.
        @AuraEnabled public String reference {get; set;}
    }
    
    
    
    
}