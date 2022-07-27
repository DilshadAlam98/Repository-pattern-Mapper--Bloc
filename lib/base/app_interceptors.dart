import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions requestOptions, RequestInterceptorHandler handler) {
    print("${requestOptions.method} ${requestOptions.path}");
    print(requestOptions.uri);
    super.onRequest(requestOptions, handler); //add this line
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(dioError.message);
    super.onError(dioError, handler); //add this line
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.statusCode);
    print(response.data);
    print(handler.isCompleted);
    // do something before response
    super.onResponse(response, handler); //add this line
  }
}
