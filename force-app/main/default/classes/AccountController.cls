public with sharing class AccountController {

  public static List<Account> getAccountsCRUDCheck() {
    if (Schema.sObjectType.Account.isAccessible()) {
      return [
        SELECT Name, AnnualRevenue, Industry
        FROM Account
        ORDER BY Name
      ];
    }
    return new List<Account>();
  }

  public static List<Account> getAccountsFLSCheck() {
    if (Schema.sObjectType.Account.fields.Name.isAccessible()
      && Schema.sObjectType.Account.fields.AnnualRevenue.isAccessible()
      && Schema.sObjectType.Account.fields.Industry.isAccessible()) {
      return [
        SELECT Name, AnnualRevenue, Industry
        FROM Account
        ORDER BY Name
      ];
    }
    return new List<Account>();
  }

  public static List<Account> getAccountsWithSecurityEnforced() {
    return [
      SELECT Name, AnnualRevenue, Industry
      FROM Account
      WITH SECURITY_ENFORCED
      ORDER BY Name
    ];
  }

  public static List<Account> getAccountsStripInaccessible() {
    SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE,[
      SELECT Name, AnnualRevenue, Industry
      FROM Account
      WITH SECURITY_ENFORCED
      ORDER BY Name
    ]);

    return securityDecision.getRecords();
  }

  public static Account createAccountCRUDCheck() {
    Account acct;
    if (Schema.sObjectType.Account.isCreateable()) {
      acct = new Account();
      acct.Name = 'Cruzcampo';
      acct.AnnualRevenue = 1000000;
      acct.Industry = 'Food & Beverage';

      insert acct;
    }

    return acct;
  }

  public static Account createAccounFLSCheck() {
    Account acct;
    if (Schema.sObjectType.Account.fields.Name.isCreateable()
    && Schema.sObjectType.Account.fields.AnnualRevenue.isCreateable()
    && Schema.sObjectType.Account.fields.Industry.isCreateable()) {
      acct = new Account();
      acct.Name = 'Cruzcampo';
      acct.AnnualRevenue = 1000000;
      acct.Industry = 'Food & Beverage';

      insert acct;
    }

    return acct;
  }

  public static Account createAccountStripInaccessible() {
    Account acct = new Account();
    acct.Name = 'Cruzcampo';
    acct.AnnualRevenue = 1000000;
    acct.Industry = 'Food & Beverage';

    SObjectAccessDecision securityDecision = Security.stripInaccessible(
                                        AccessType.CREATABLE, new List<Account>{acct});

    insert securityDecision.getRecords();

    return (Account)securityDecision.getRecords()[0];
  }
}
