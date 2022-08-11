public with sharing class AccountController {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts() {
    return [SELECT Name, AnnualRevenue, Industry FROM Account ORDER BY Name];
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountsCRUDCheck() {
    if (Schema.sObjectType.Account.isAccessible()) {
      return [SELECT Name, AnnualRevenue, Industry FROM Account ORDER BY Name];
    }
    return new List<Account>();
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountsFLSCheck() {
    if (
      Schema.sObjectType.Account.fields.Name.isAccessible() &&
      Schema.sObjectType.Account.fields.AnnualRevenue.isAccessible() &&
      Schema.sObjectType.Account.fields.Industry.isAccessible()
    ) {
      return [SELECT Name, AnnualRevenue, Industry FROM Account ORDER BY Name];
    }
    return new List<Account>();
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountsWithSecurityEnforced() {
    return [
      SELECT Name, AnnualRevenue, Industry
      FROM Account
      WITH SECURITY_ENFORCED
      ORDER BY Name
    ];
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getAccountsStripInaccessible() {
    SObjectAccessDecision securityDecision = Security.stripInaccessible(
      AccessType.READABLE,
      [SELECT Name, AnnualRevenue, Industry FROM Account ORDER BY Name]
    );

    System.debug(securityDecision.getRecords());

    return securityDecision.getRecords();
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getFilteredAccountsInjection(String searchValue) {
    String likeValue = '\'%' + searchValue + '%\'';
    return (List<Account>) Database.query(
      'SELECT Name, AnnualRevenue, Industry FROM Account WHERE Name LIKE ' +
      likeValue +
      ' ORDER BY Name'
    );
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getFilteredAccounts(String searchValue) {
    String likeValue = '%' + searchValue + '%';
    return [
      SELECT Name, AnnualRevenue, Industry
      FROM Account
      WHERE Name LIKE :likeValue
      ORDER BY Name
    ];
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getFilteredAccounts2(String searchValue) {
    String likeValue = '%' + searchValue + '%';
    return (List<Account>) Database.query(
      'SELECT Name, AnnualRevenue, Industry FROM Account WHERE Name LIKE :likeValue ORDER BY Name'
    );
  }

  @AuraEnabled(cacheable=true)
  public static List<Account> getFilteredAccounts3(String searchValue) {
    String likeValue = '\'%' + String.escapeSingleQuotes(searchValue) + '%\'';
    return (List<Account>) Database.query(
      'SELECT Name, AnnualRevenue, Industry FROM Account WHERE Name LIKE ' +
      likeValue +
      ' ORDER BY Name'
    );
  }

  @AuraEnabled
  public static Account createAccount() {
    Account acct = new Account();
    acct.Name = 'ACME';
    acct.AnnualRevenue = 1000000;
    acct.Industry = 'Food & Beverage';

    insert acct;

    return acct;
  }

  @AuraEnabled
  public static Account createAccountCRUDCheck() {
    Account acct;
    if (Schema.sObjectType.Account.isCreateable()) {
      acct = new Account();
      acct.Name = 'ACME';
      acct.AnnualRevenue = 1000000;
      acct.Industry = 'Food & Beverage';

      insert acct;
    } else {
      throw new DMLException('No object permissions to create account.');
    }

    return acct;
  }

  @AuraEnabled
  public static Account createAccountFLSCheck() {
    Account acct;
    if (
      Schema.sObjectType.Account.fields.Name.isCreateable() &&
      Schema.sObjectType.Account.fields.AnnualRevenue.isCreateable() &&
      Schema.sObjectType.Account.fields.Industry.isCreateable()
    ) {
      acct = new Account();
      acct.Name = 'ACME';
      acct.AnnualRevenue = 1000000;
      acct.Industry = 'Food & Beverage';

      insert acct;
    } else {
      throw new DMLException('No field permissions to create account.');
    }

    return acct;
  }

  @AuraEnabled
  public static Account createAccountStripInaccessible() {
    Account acct = new Account();
    acct.Name = 'ACME';
    acct.AnnualRevenue = 1000000;
    acct.Industry = 'Food & Beverage';

    SObjectAccessDecision securityDecision = Security.stripInaccessible(
      AccessType.CREATABLE,
      new List<Account>{ acct }
    );

    insert securityDecision.getRecords();

    return (Account) securityDecision.getRecords()[0];
  }
}
