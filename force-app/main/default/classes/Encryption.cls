public with sharing class Encryption {
  @AuraEnabled
  public static String encryptAES256() {
    // Use generate AES key (private key)
    Blob cryptoKey = Crypto.generateAesKey(256);

    Blob data = Blob.valueOf('Test data');

    Blob encryptedData = Crypto.encryptWithManagedIV('AES256', cryptoKey, data);

    // Encode Blob in Base64 so that we can represent it as an ASCII String
    return EncodingUtil.base64Encode(encryptedData);
  }

  @AuraEnabled
  public static String hashSHA512() {
    Blob data = Blob.valueOf('Test data');

    Blob hash = Crypto.generateDigest('SHA512', data);

    // Encode Blob in Base64 so that we can represent it as an ASCII String
    return EncodingUtil.base64Encode(hash);
  }

  @AuraEnabled
  public static String macHMAC512() {
    // Use generate AES key (private key)
    Blob cryptoKey = Blob.valueOf('mysupersecretkey');

    Blob data = Blob.valueOf('Test data');

    Blob mac = Crypto.generateMac('hmacSHA512', data, cryptoKey);

    // Encode Blob in Base64 so that we can represent it as an ASCII String
    return EncodingUtil.base64Encode(mac);
  }

  @AuraEnabled
  public static String digitalSignature() {
    // Use generate AES key (private key)
    Blob cryptoKey = EncodingUtil.base64Decode(PRIVATE_KEY);

    Blob data = Blob.valueOf('Test data');

    Blob digitalSignature = Crypto.sign('RSA', data, cryptoKey);

    // Encode Blob in Base64 so that we can represent it as an ASCII String
    return EncodingUtil.base64Encode(digitalSignature);
  }

  static final String PRIVATE_KEY = 'XXXX';
}
