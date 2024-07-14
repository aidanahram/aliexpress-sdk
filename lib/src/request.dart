/// Request Object used by [Client] in [Client.execute]
class IopRequest {
  String apiName;
  String httpMethod;
  final Map<String, String> apiParams = {};
  final fileParams = {};
  String simplify = "false";
  String format = "json";

  IopRequest(this.apiName, {this.httpMethod = "Post"});

  void addParam(String key, String value) => apiParams[key] = value;

  void addFileParam(String key, String value) => fileParams[key] = value;

  void setSimplify() => simplify = "true";

  void setFormat(String value) => format = value;
}


