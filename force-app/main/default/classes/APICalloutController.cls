public with sharing class APICalloutController {
  @AuraEnabled
  public static String getShows() {
    return new APIAccessService().getShows();
  }

  @AuraEnabled
  public static String getShowsNamedCredential() {
    return new APIAccessServiceNamedCredential().getShows();
  }

  @AuraEnabled
  public static String getShowsNamedCredentialFields() {
    return new APIAccessServiceNamedCredentialFields().getShows();
  }
}
