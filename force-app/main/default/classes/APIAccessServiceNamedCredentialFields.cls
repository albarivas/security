public class APIAccessServiceNamedCredentialFields {
  public String getShows() {
    HttpRequest req = new HttpRequest();
    req.setEndpoint('callout:sampleAPIMergeFields/services/apexrest/shows');
    req.setMethod('GET');
    req.setHeader('Authorization', 'OAuth {!$Credential.OAuthToken}');

    Http http = new Http();
    HTTPResponse res = http.send(req);

    return res.getBody();
  }
}
