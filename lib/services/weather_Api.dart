import 'package:dio/dio.dart';

import '../models/weather_model.dart';


class WeatherApp
{
  final Dio dio;
  final String apikey='70e894c9a4fc40ee9e0194908242006';
  final String baseurl='https://api.weatherapi.com/v1';

  WeatherApp({ required this.dio});

  Future<WeatherModle>getcurrentweather({required String city})async
  {
    try {
      final Response response = await dio.get(
          '$baseurl/forecast.json?key=$apikey&q=$city&days=10');
      WeatherModle weatherModle = WeatherModle.fromJson(response.data);
      return weatherModle;
    }
    on DioException catch(e){
      final String errmassage=e.response?.data['error']['message']??'opps there are an errors';
      throw Exception(errmassage);
    }



  }


}