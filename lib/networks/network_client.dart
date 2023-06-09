import 'package:dio/dio.dart';

import '../errors/exceptions.dart';

class NetworkClient {
  Dio _dio = Dio();
  String baseUrl = "https://jsonplaceholder.typicode.com";

  NetworkClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: Duration(seconds: 50),
      connectTimeout: Duration(milliseconds: 30000),
      baseUrl: baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor(
     
    ));
  }

  // for HTTP.GET Request.
  Future<Response> get(String url, Map<String, dynamic>? params,
      {String? token}) async {
    Response response;
    try {
      Map<String, dynamic> map = {"Accept": "application/json"};
      if (token != null) map.addAll({"Authorization": "Bearer $token"});

      response = await _dio.get(url,
          queryParameters: params,
          options: Options(
            headers: map,
          ));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  // Future<Response> post(String url, Map<String, dynamic> params) async {
  //   Response response;
  //   try {
  //     response = await _dio.post(url,
  //         data: params,
  //         options: Options(
  //           responseType: ResponseType.json,
  //         ));
  //   } on DioError catch (exception) {
  //     throw RemoteException(dioError: exception);
  //   }
  //   return response;
  // }

  Future<Response> post(String url, dynamic params, {String? token}) async {
    Response response;
    try {
      Map<String, dynamic> map = {"Accept": "application/json"};
      if (token != null) {
        map.addAll({"Authorization": "Bearer $token"});
      }
      response = await _dio.post(url,
          data: params,
          options: Options(
            headers: map,
            responseType: ResponseType.json,
            validateStatus: (_) => true,
          ));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.PATCH Request.
  Future<Response> patch(String url, Map<String, Object> params) async {
    Response response;
    try {
      response = await _dio.patch(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for dwonload Request.
  Future<Response> download(String url, String pathName,
      void Function(int, int)? onReceiveProgress) async {
    Response response;
    try {
      response = await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }
}
