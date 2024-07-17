import 'package:aliexpress_sdk/aliexpress_sdk.dart';

void main() async {
  // params 1 : gateway url
  // params 2 : appkey
  // params 3 : appSecret
  final client =
      IopClient("api-sg.aliexpress.com", '508156', 'your_app_secret');

  // create a api request set GET mehotd
  // default http method is POST
  final request = IopRequest('/auth/token/create');
  request.addParam("code", "3_508156_0B6q8xRJgGk4iSTVqmhSSaKC566");
  request.addParam('uuid', 'uuid');
  final response = await client.execute(request);

  // response type nil,ISP,ISV,SYSTEM
  // nil ：no error
  // ISP : API Service Provider Error
  // ISV : API Request Client Error
  // SYSTEM : Iop platform Error
  print(response.type);

  // response code, 0 is no error
  print(response.code);

  // response error message
  print(response.message);

  // response unique id
  print(response.requestId);

  // full response
  print(response.body);
}
