/// Request Object used by [Client] in [Client.execute]
class IopRequest {
  String apiName;
  String httpMethod;
  final Map<String, String> queryParams = {};
  final fileParams = {};
  String simplify = "false";
  String format = "json";

  /// Constructor for [IopRequest]
  ///
  /// Takes in the [apiName] and a method.
  /// Default method is post
  IopRequest(this.apiName, {this.httpMethod = "Post"});

  /// Function to add query parameter to request
  void addParam(String key, String value) => queryParams[key] = value;

  /// Function to add file parameters to request
  ///
  /// For more information about file parameters visit the [Requests] library
  void addFileParam(String key, String value) => fileParams[key] = value;

  /// Set simplfy
  ///
  /// By default simplify is set to "false" when [IopRequest] is constructed
  void setSimplify() => simplify = "true";

  /// Set format
  ///
  /// By default simplify is set to "json" when [IopRequest] is constructed
  void setFormat(String value) => format = value;
}
