enum RequestMethod {
  get,
  post,
  put,
}

enum RequestType {
  http,
  graphql,
}

class RequestModel {
  final RequestMethod requestMethod;
  final RequestType requestType;
  String route;
  final String? body;
  final Map<String, dynamic>? queryParams;
  Map<String, dynamic>? grapqlVariables;

  RequestModel({
    required this.route,
    required this.requestType,
    required this.requestMethod,
    this.grapqlVariables,
    this.queryParams,
    this.body,
  });
}
