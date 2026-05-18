@RestResource(urlMapping='/AccountServices/*')
global with sharing class AccountServices {

    @HttpGet
    global static Account doGetAccDetails() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountName = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        accountName = accountName.replace('_',' ');
        Account result = [SELECT Id, 
                                 Name, 
                                 Phone, 
                                 Website, 
                                 BillingStreet, 
                                 BillingCity, 
                                 BillingState,
                                 BillingPostalCode,
                                 BillingCountry 
                          FROM Account 
                          WHERE name = :accountName];
        return result;
    }
}