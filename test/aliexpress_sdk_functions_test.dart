import "package:aliexpress_sdk/iop.dart";

void main() {
  /// Following the example provided by the official Aliexpress documentation
  /// https://openservice.aliexpress.com/doc/doc.htm?spm=a2o9m.11193531.0.0.775f3b53pMXezL&nodeId=27493&docId=118729#/?docId=1366
  final parameters = {
    "app_key" : "12345678",
    "code" : "3_500102_JxZ05Ux3cnnSSUm6dCxYg6Q26",
    "sign_method" : "sha256",
    "timestamp" : "1517820392000"
  };
  final hex = sign("helloworld", "/auth/token/create", parameters);
  print(hex);
  final expected = "35607762342831B6A417A0DED84B79C05FEFBF116969C48AD6DC00279A9F4D81";
  if(hex != expected){
    print("Expected Condition not met");
    throw Error();
  }
}