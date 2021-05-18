public with sharing class ContactController {
  @AuraEnabled
  public static Contact getContactXSS() {
    return [SELECT Name FROM Contact WHERE Name = 'alert(\'Malicious!\')'];
  }
}
