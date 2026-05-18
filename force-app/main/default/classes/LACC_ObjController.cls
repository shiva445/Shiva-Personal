public with sharing class LACC_ObjController {
  @AuraEnabled
  public static List<User> getMyObjects() {
    return [SELECT Id, Name FROM User];
  }
}