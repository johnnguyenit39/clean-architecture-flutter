import 'package:getjoke/core/network/http_request/request_model/request_model.dart';

class SubmitJokeRequest extends RequestModel {
  SubmitJokeRequest({String? body, Map<String, dynamic>? queryParams})
      : super(
          route: '/joke/Any',
          requestType: RequestType.http,
          requestMethod: RequestMethod.get,
          body: body,
          queryParams: queryParams ?? {},
        );
}
