public with sharing class Encryption {
  // Encrypts data with symmetric key --> secrecy
  @AuraEnabled
  public static String encryptAES256() {
    // Generate AES key
    Blob cryptoKey = Crypto.generateAesKey(256);

    Blob data = Blob.valueOf('Test data');

    Blob encryptedData = Crypto.encryptWithManagedIV('AES256', cryptoKey, data);

    // Encode Blob in Base64
    return EncodingUtil.base64Encode(encryptedData);
  }

  // Generates hash that can be checked in destination --> integrity
  @AuraEnabled
  public static String hashSHA512() {
    Blob data = Blob.valueOf('Test data');

    Blob hash = Crypto.generateDigest('SHA512', data);

    // Encode Blob in Base64
    return EncodingUtil.base64Encode(hash);
  }

  // Generates hash and encrypts it with a symmetric key --> integrity and authenticity
  @AuraEnabled
  public static String macHMAC512() {
    // Use private key
    Blob cryptoKey = Blob.valueOf('mysupersecretkey');

    Blob data = Blob.valueOf('Test data');

    Blob mac = Crypto.generateMac('hmacSHA512', data, cryptoKey);

    // Encode Blob in Base64
    return EncodingUtil.base64Encode(mac);
  }

  // Hash of the message is encrypted with the private key of the sender --> integrity, authenticity and no-repudiation
  @AuraEnabled
  public static String digitalSignature() {
    // Use private key (must be in RSA's PKCS #8 (1.2) Private-Key Information Syntax Standard form)
    Blob cryptoKey = EncodingUtil.base64Decode(PRIVATE_KEY);

    Blob data = Blob.valueOf('Test data');

    Blob digitalSignature = Crypto.sign('RSA', data, cryptoKey);

    // Encode Blob in Base64
    return EncodingUtil.base64Encode(digitalSignature);
  }

  static final String PRIVATE_KEY = 'XXXX';
}
