/// Simple class to contains the return from an [IopRequest]
class IopResponse {
  String type = "";
  String code = "";
  String message = "";
  String requestId = "";
  Map<String, String> body = {};
  /// Empty Constructor
  /// 
  /// Class variables are set after [IopRequest] is executed by [IopClient.execute]
  IopResponse();
}
