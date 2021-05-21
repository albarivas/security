public with sharing class APICalloutController {
  @AuraEnabled
  public static String getShows() {
    return new APIAccessService().getShows();
  }
}
