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
  final String? params;
  Map<String, dynamic>? grapqlVariables;

  RequestModel({
    required this.route,
    required this.requestType,
    required this.requestMethod,
    this.grapqlVariables,
    this.params,
  });
}
