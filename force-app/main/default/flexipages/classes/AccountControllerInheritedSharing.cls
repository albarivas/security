public inherited sharing class AccountControllerInheritedSharing {

  public static List<Account> getAccounts() {
      return [
        SELECT Name, AnnualRevenue, Industry
        FROM Account
        ORDER BY Name
      ];
  }
}
