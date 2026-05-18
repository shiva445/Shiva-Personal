public class ContactsMapCtrl {
    
    
	@AuraEnabled
    public static List<accountLocationWrapper> getContactMarkers(Id accId){
        List<accountLocationWrapper> markerList = new List<accountLocationWrapper>();//variable declaration and instantiation
        
        
        List<Contact> conList = [SELECT MailingStreet,
                                 		MailingCity,
                                 		MailingState,
                                 		MailingCountry,
                                 		MailingPostalCode,
                                 		description,
                                 		Name
                                 		
                                 FROM Contact 
                                 WHERE accountId=:accId];
        
		
        
        
        for(Contact con:conList){
            
            if(String.isNotBlank(con.mailingstreet)){
                locationDetailWrapper locDetail = new locationDetailWrapper();
                locDetail.Street = con.mailingStreet;
                locDetail.City = con.MailingCity;
                locDetail.State = con.MailingState;
                locDetail.Country = con.MailingCountry;
                locDetail.PostalCode = con.MailingPostalCode;
                
                
                accountLocationWrapper accLocation = new accountLocationWrapper();
                accLocation.location = locDetail;
                accLocation.icon = 'utility:location'; 
                accLocation.title = con.Name;
                accLocation.description = con.description;
                
                markerList.add(accLocation);
            }
            
            
        }
        
        
        return markerList;
        
        
    }
        
    public class accountLocationWrapper{
        @AuraEnabled public string icon{get;set;} 
        @AuraEnabled public string title{get;set;} 
        @AuraEnabled public string description{get;set;} 
        @AuraEnabled public locationDetailWrapper location{get;set;} 
    }
        
        
    public class locationDetailWrapper{
        @AuraEnabled public string Street{get;set;}
        @AuraEnabled public string PostalCode{get;set;}
        @AuraEnabled public string City{get;set;}
        @AuraEnabled public string State{get;set;}
        @AuraEnabled public string Country{get;set;}
    }
    
}