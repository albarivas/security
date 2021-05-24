public with sharing class SecretsController {
  // This class cannot be deployed because we're trying to hit protected items!
  /*@AuraEnabled
    public static string useProtectedCustomSetting(){
        Protected_Setting__c setting = Protected_Setting__c.getInstance();
		return setting.Sensitive_Field__c ;
    }

    @AuraEnabled
    public static string useProtectedCustomMetadata(){
        Protected_Metadata__mdt[] mds = [SELECT Sensitive_Field__c FROM Protected_Metadata__mdt WHERE DeveloperName = 'Public_Record'];
        return mds[0].Sensitive_Field__c;
    }

    @AuraEnabled
    public static string useProtectedCustomMetadataRecord(){
        Public_Metadata__mdt[] mds = [SELECT Sensitive_Field__c FROM Public_Metadata__mdt WHERE DeveloperName = 'Protected_Record'];
        return mds[0].Sensitive_Field__c;
    }*/
}
