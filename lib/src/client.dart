import 'dart:convert';
import 'package:aliexpress_sdk/aliexpress_sdk.dart';
import 'package:http/http.dart' as http;

/// A client to send [IopRequest] through
///
/// Generate an [IopRequest] and pass it to [IopClient]
class IopClient {
  final String _serverUrl;
  final String _appKey;
  final String _appSecret;
  int timeout;

  /// Constructor for class
  IopClient(this._serverUrl, this._appKey, this._appSecret,
      {this.timeout = 30});

  /// Sends and [IopRequest] and return a [Future] of [IopResponse]
  Future<IopResponse> execute(IopRequest request, {String? accessToken}) async {
    final sysParameters = {
      "app_key": _appKey,
      "sign_method": "sha256",
      "timestamp": DateTime.timestamp().millisecondsSinceEpoch.toString(),
      // "partner_id": P_SDK_VERSION,
      "method": request.apiName,
      "simplify": request.simplify,
      "format": request.format
    };

    if (accessToken != null) {
      sysParameters["session"] = accessToken;
    }

    final applicationParameters = request.queryParams;

    final signParameters = sysParameters;
    signParameters.addAll(applicationParameters);
    signParameters["sign"] = sign(_appSecret, request.apiName, signParameters);

    final uri = Uri.http(_serverUrl, "/rest${request.apiName}", signParameters);
    print(uri);
    http.Response r;
    if (request.httpMethod == 'POST' || request.fileParams.isNotEmpty) {
      r = await http.post(uri, body: request.fileParams);
    } else {
      r = await http.get(uri);
    }

    if (r.statusCode >= 400) {
      print("Error Occured");
      return IopResponse();
    }

    final response = IopResponse();

    final data = await jsonDecode(r.body);
    if (data.containsKey('code')) {
      print("contains Code");
      response.code = data['code']!;
    }
    if (data.containsKey('type')) {
      response.type = data['type']!;
    }
    if (data.containsKey('message')) {
      response.message = data['message']!;
    }
    if (data.containsKey('request_id')) {
      response.requestId = data['request_id']!;
    }
    response.body = data;
    return response;
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
