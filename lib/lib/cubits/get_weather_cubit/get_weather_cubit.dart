import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'get_weather_states.dart';


class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(initialState());
  Future GetWeather({required cityname}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService(Dio()).getcurrentWeather(cityname: cityname);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
