public without sharing class AccountControllerWithoutSharing {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts() {
    return [SELECT Name, AnnualRevenue, Industry FROM Account ORDER BY Name];
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountsUserMode() {
    return [
      SELECT Name, AnnualRevenue, Industry
      FROM Account
      WITH USER_MODE
      ORDER BY Name
    ];
  }
}
