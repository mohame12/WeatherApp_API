import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_Api.dart';

class GetWeatherCubit extends Cubit<WeatherState>
{
  GetWeatherCubit():super(initialState());

 WeatherModle? weatherModle;

  getWeather({required String city})async
  {
    try {
       weatherModle = await WeatherApp(dio: Dio())
          .getcurrentweather(city: city);
      emit(WeatherloadedCubitState());
    }
    catch(e)
    {
      emit(FalidWeatherCubitState());
    }
  }

}