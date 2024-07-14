import 'package:aliexpress_sdk/iop.dart';


void main() {
  // params 1 : gateway url
// params 2 : appkey
// params 3 : appSecret
final client = IopClient("https://api-sg.aliexpress.com", '508156', 'Z3AkHoDLoTsK34fu8txgwtnC8vQyMC4j');

// create a api request set GET mehotd
// default http method is POST
final request = IopRequest('/auth/token/create');
request.addParam("code", "caksdlkj");
request.addParam('uuid', 'uuid');
final response = client.execute(request);
// print(response.type)
// print(response.body)

// // response type nil,ISP,ISV,SYSTEM
// // nil ：no error
// // ISP : API Service Provider Error
// // ISV : API Request Client Error
// // SYSTEM : Iop platform Error
// print(response.type)

// // response code, 0 is no error
// print(response.code)

// // response error message
// print(response.message)

// // response unique id
// print(response.request_id)

// // full response
// print(response.body);
}
