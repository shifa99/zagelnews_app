import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;
  static String apiKey = '8d62505d99f54ba5adeb47e6beec7a4a';
  static void initilize() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({Map<String, dynamic> query}) async {
    Response response = await dio.get(
      'v2/top-headlines',
      queryParameters: query,
    );
    return response;
  }
}
