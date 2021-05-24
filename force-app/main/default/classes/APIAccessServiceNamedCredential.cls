public class APIAccessServiceNamedCredential {
  public String getShows() {
    HttpRequest req = new HttpRequest();
    req.setEndpoint('callout:sampleAPI/services/apexrest/shows');
    req.setMethod('GET');

    Http http = new Http();
    HTTPResponse res = http.send(req);

    return res.getBody();
  }
}
