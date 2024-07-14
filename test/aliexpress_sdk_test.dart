import 'package:aliexpress_sdk/aliexpress_sdk.dart';
import 'package:test/test.dart';

void main() {
  final request = IopRequest("508156", "/auth/token/create");
  request.addFileParam("code", "myCode");
}
