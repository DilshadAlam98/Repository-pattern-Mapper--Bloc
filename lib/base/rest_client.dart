import 'package:dio/dio.dart';
import 'package:mapper/base/app_interceptors.dart';

class RestClient {
  late Dio dio;
  String baseUrl = "https://api.themoviedb.org/3/movie";

  RestClient() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
      responseType: ResponseType.json,
    ));
    dio.interceptors.add(AppInterceptor());
  }
}
