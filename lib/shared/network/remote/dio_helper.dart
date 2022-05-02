import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio=Dio();

  static initDio() {

    dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 3000,


    ));
  }

  static Future<Response> getData({required String path, required Map<String, dynamic> query}) async {
    return await dio.get(path, queryParameters: query);
  }
}
