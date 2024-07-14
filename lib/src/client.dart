import 'package:aliexpress_sdk/src/request.dart';
import 'package:requests/requests.dart';
import 'functions.dart';

class IopClient{
  String _serverUrl;
  String _appKey;
  String _appSecret;
  int timeout; 
  IopClient(this._serverUrl, this._appKey, this._appSecret, {this.timeout = 30});

  void execute(IopRequest request, {String? accessToken}) async {
    final sysParameters = {
      "app_key": _appKey,
      "sign_method": "sha256",
      "timestamp": DateTime.timestamp().microsecondsSinceEpoch.toString(),
      // "partner_id": P_SDK_VERSION,
      "method": request.apiName,
      "simplify": request.simplify,
      "format":request.format
    };

    if(accessToken != null){
      sysParameters["session"] = accessToken;
    }

    final applicationParameters = request.apiParams;

    final signParameters = sysParameters;
    signParameters.addAll(applicationParameters);
    signParameters["sign"] = sign(_appSecret, request.apiName, signParameters);

    String url = "$_serverUrl${request.apiName}";
    if(request.httpMethod == 'POST' || request.fileParams.isNotEmpty){
      final r = await Requests.post(url, queryParameters: signParameters, 
        json: request.fileParams, timeoutSeconds: timeout);
    } else {
      final r = await Requests.get(url, queryParameters: signParameters, timeoutSeconds: timeout);
    }

    //response = IopResponse();
  
  }

        
}

// P_CODE = 'code'
// P_TYPE = 'type'
// P_MESSAGE = 'message'
// P_REQUEST_ID = 'request_id'

// P_APPKEY = "app_key"
// P_ACCESS_TOKEN = "session"
// P_TIMESTAMP = "timestamp"
// P_SIGN = "sign"
// P_SIGN_METHOD = "sign_method"
// P_PARTNER_ID = "partner_id"
// P_METHOD = "method"
// P_DEBUG = "debug"
// P_SIMPLIFY = "simplify"
// P_FORMAT = "format"

// P_CODE = 'code'
// P_TYPE = 'type'
// P_MESSAGE = 'message'
// P_REQUEST_ID = 'request_id'