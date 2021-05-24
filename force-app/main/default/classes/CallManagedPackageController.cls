public with sharing class CallManagedPackageController {
  @AuraEnabled
  public static string useProtectedCustomSetting() {
    return albapkg.AuthenticatedService.useProtectedCustomSetting();
  }

  @AuraEnabled
  public static string useProtectedCustomMetadata() {
    return albapkg.AuthenticatedService.useProtectedCustomMetadata();
  }

  @AuraEnabled
  public static string useProtectedCustomMetadataRecord() {
    return albapkg.AuthenticatedService.useProtectedCustomMetadataRecord();
  }
}
