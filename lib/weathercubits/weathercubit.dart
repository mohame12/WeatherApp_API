import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_Api.dart';
import 'package:weather_app/weathercubits/weatherstates.dart';

class WeatherCubit extends Cubit<WeatherStates>
{
  WeatherCubit(): super(WeatherLoadingstates());
  WeatherModle? weatherModle;
  Future<void> getweathercubit({required String cityname})
  async {
    emit(WeatherLoadingstates());
       try{
         weatherModle=await WeatherApp(dio: Dio()).getcurrentweather(city: cityname);
         emit(WeatherSuccesstates());
       }catch(e){
         emit(WeatherFailurstates());
       }

  }

}