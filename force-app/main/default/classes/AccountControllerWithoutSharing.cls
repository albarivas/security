public without sharing class AccountControllerWithoutSharing {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts() {
    return [SELECT Name, AnnualRevenue, Industry FROM Account ORDER BY Name];
  }
}
