class WeatherModle {
  final String city;
  final String? image;
  final DateTime date;
  final double avrtemp;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String weatherContion;
  WeatherModle({required this.avrtemp,required this.weatherContion,required this.image,required this.date,required this.temp,required this.maxtemp,required this.city,required this.mintemp});

  factory WeatherModle.fromJson(json)
  {
    return WeatherModle(
        temp: json['current']['temp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        city: json['location']['name'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        image: json['current']['condition']['icon'],
        date: DateTime.parse(json['current']['last_updated']),
        weatherContion: json['current']['condition']['text'],
        avrtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c']);
  }

}