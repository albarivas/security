public without sharing class AccountControllerWithoutSharing {

  public static List<Account> getAccounts() {
      return [
        SELECT Name, AnnualRevenue, Industry
        FROM Account
        ORDER BY Name
      ];
  }
}
