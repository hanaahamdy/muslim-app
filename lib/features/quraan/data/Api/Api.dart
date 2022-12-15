import 'package:dio/dio.dart';

class Api {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "http://api.alquran.cloud/v1/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getQuranData({required String url}) async {
    return await dio.get(url);
  }

  static late Dio radioDio;

  static radioInit() {
    radioDio = Dio(BaseOptions(
        baseUrl: "https://www.mp3quran.net/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getRadioData() async {
    return await radioDio.get("api/radio/radio_ar.json");
  }
}
