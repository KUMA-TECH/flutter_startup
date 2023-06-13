import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class Crypto {
  /// AES 加密解密
  String aes(String? input, String keyString, bool encrypt) {
    if (input?.isEmpty ?? true) return '';
    var key = Key.fromUtf8(keyString);
    var iv = IV.fromLength(16);

    var encrypter = Encrypter(AES(key));

    var result = encrypt
        ? encrypter.encrypt(input!, iv: iv)
        : encrypter.decrypt(Encrypted.fromUtf8(input!), iv: iv);

    return result.toString();
  }

  /// base64 加密
  String base64Encrypt(String? input) {
    if (input?.isEmpty ?? true) return '';
    var bytes = utf8.encode(input!);
    var encode = base64Encode(bytes);
    return encode;
  }

  /// base64 解密
  String base64Decrypt(String? input) {
    if (input?.isEmpty ?? true) return '';
    var decode = base64Decode(input!);
    return utf8.decode(decode);
  }

  /// base64url 加密
  String base64UrlEncrypt(String? input) {
    if (input?.isEmpty ?? true) return '';
    var bytes = utf8.encode(input!);
    var encode = base64UrlEncode(bytes);
    return encode;
  }

  /// base64Url 解密
  String base64UrlDecrypt(String? input) {
    return base64Decrypt(input);
  }

  /// md5 加密
  String md5Encrypt(String? input) {
    if (input?.isEmpty ?? true) return '';
    var bytes = utf8.encode(input!);
    Digest digest = md5.convert(bytes);
    return digest.toString();
  }

  /// sha 加密， 默认 sha256
  String shaEncrypt(String? input, {int sha = 256}) {
    if (input?.isEmpty ?? true) return '';
    var bytes = utf8.encode(input!);
    Digest digest;
    switch (sha) {
      case 1:
        digest = sha1.convert(bytes);
        break;
      case 224:
        digest = sha224.convert(bytes);
        break;
      case 384:
        digest = sha384.convert(bytes);
        break;
      case 512:
        // [SHA-512][rfc]
        digest = sha512.convert(bytes);
        break;
      case 512224:
        // [SHA-512/224][FIPS]
        digest = sha512224.convert(bytes);
        break;
      case 512256:
        // SHA-512/256][FIPS]
        digest = sha512256.convert(bytes);
        break;
      case 256:
      default:
        digest = sha256.convert(bytes);
    }
    return digest.toString();
  }
}
