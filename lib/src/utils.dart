import 'package:crypto/crypto.dart';
import 'dart:convert';

/// Function to generate hash based on [parameters]
String sign(String secret, String api, Map<String, String> parameters){
  final sortedByKeyMap = Map.fromEntries(
    parameters.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
  utf8.encode(secret);
  String paramStr = "";
  if(api.contains("/")){
    paramStr += api;
  }
  parameters.forEach((key, value) {paramStr += "$key${sortedByKeyMap[key]}"; });
  final hmacSha256 = Hmac(sha256, utf8.encode(secret)); 
  final digest = hmacSha256.convert(utf8.encode(paramStr));
  return digest.toString().toUpperCase();
}