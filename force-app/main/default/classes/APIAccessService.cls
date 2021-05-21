public class APIAccessService {
  private String accessToken;
  private String instanceUrl;

  // user password oauth2 flow
  public APIAccessService() {
    String clientId = 'XXXXXX';
    String clientSecret = 'XXXXXX';
    String username = 'XXXXXX';
    String password = 'XXXXXX';

    HttpRequest req = new HttpRequest();
    req.setMethod('POST');
    req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
    req.setBody(
      'grant_type=password&client_id=' +
      clientId +
      '&client_secret=' +
      clientSecret +
      '&username=' +
      username +
      '&password=' +
      password
    );

    Http http = new Http();
    HTTPResponse res = http.send(req);

    OAuthResponse resp = (OAuthResponse) Json.deserialize(
      res.getBody(),
      OAuthResponse.class
    );
    accessToken = resp.access_token;
    instanceUrl = resp.instance_url;
  }

  public String getShows() {
    String endpoint = instanceUrl + '/services/apexrest/shows';

    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpoint);
    req.setMethod('GET');
    req.setHeader('Authorization', 'OAuth ' + accessToken);

    Http http = new Http();
    HTTPResponse res = http.send(req);

    return res.getBody();
  }

  public class OAuthResponse {
    String id;
    String instance_url;
    String access_token;
    String issued_at;
    String signature;
  }
}
