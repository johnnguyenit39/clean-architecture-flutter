import 'package:getjoke/core/env/app_env.dart';
import 'package:getjoke/core/network/http_request/interceptors/interceptors.dart';
import 'package:getjoke/core/network/http_request/request_model/request_model.dart';
import 'package:getjoke/core/network/http_request/request_model/request_status_code.dart';
import 'package:getjoke/core/network/http_request/response_models/base_request_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef ApiResponseToModelParser<T> = T Function(Map<String, dynamic> json);

class ApiService {
  var dio = Dio();

  static final ApiService _singleton = ApiService._internal();
  CancelToken cancelToken = CancelToken();
  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();

  void initialLizeNetworkSetting() async {
    interceptorInit();
  }

  void interceptorInit() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        try {} catch (e) {
          return handler.next(response);
        }
        return handler.next(response);
      },
      onError: (e, handler) {
        return handler.next(e);
      },
    ));

    if (kDebugMode) {
      dio.interceptors.add(dioLogger);
    }
  }

  int getTimeZoneOffSet() {
    DateTime now = DateTime.now();
    return now.timeZoneOffset.inMinutes;
  }

  Future<Options> _baseOptions() async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    Map<String, dynamic> extra = {};
    return Options(
      validateStatus: (status) => true,
      headers: headers,
      extra: extra,
    );
  }

  Future<Map<String, dynamic>> request(RequestModel request) async {
    switch (request.requestMethod) {
      case RequestMethod.get:
        return await _requestGet(request);
      case RequestMethod.post:
        return await _requestPost(request);
      case RequestMethod.put:
        return await _requestPut(request);
    }
  }

  Future<Map<String, dynamic>> _requestGet(RequestModel request) async {
    final url = '${AppConfig.baseUrl}${request.route}';

    var response = await dio.get(
      url,
      options: await _baseOptions(),
      queryParameters: request.queryParams,
    );

    return response.data;
  }

  Future<Map<String, dynamic>> _requestPost(RequestModel request) async {
    final url = '${AppConfig.baseUrl}${request.route}${request.queryParams}';
    var response = await dio.post(
      url,
      data: request.body,
      options: await _baseOptions(),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> _requestPut(RequestModel request) async {
    final url = '${AppConfig.baseUrl}${request.route}${request.queryParams}';
    var response = await dio.put(
      url,
      data: request.body,
      options: await _baseOptions(),
    );

    return response.data;
  }
}
