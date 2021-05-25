public with sharing class CallManagedPackageController {
  @AuraEnabled
  public static string useProtectedCustomSetting() {
    // return albapkg.AuthenticatedService.useProtectedCustomSetting();
    return 'Uncomment code to test managed package';
  }

  @AuraEnabled
  public static string useProtectedCustomMetadata() {
    // return albapkg.AuthenticatedService.useProtectedCustomMetadata();
    return 'Uncomment code to test managed package';
  }

  @AuraEnabled
  public static string useProtectedCustomMetadataRecord() {
    // return albapkg.AuthenticatedService.useProtectedCustomMetadataRecord();
    return 'Uncomment code to test managed package';
  }
}
