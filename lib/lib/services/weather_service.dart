import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final baseURL = 'https://api.weatherapi.com/v1';
  final Api = 'bb43a5c21c134e7486874939240607';

  WeatherService(this.dio);

  Future<WeatherModel> getcurrentWeather({required String cityname}) async {
    try {
      Response response =
          await dio.get('$baseURL/forecast.json?key=$Api&q=$cityname&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      log(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final errmessage = e.response?.data['error']['message'] ??
          'Oops, there was an error, try later';
      log('DioException: $errmessage');
      throw Exception(errmessage);
    } catch (e) {
      log('Exception: ${e.toString()}');
      throw Exception('Oops, there was an error, try later');
    }
  }
}
