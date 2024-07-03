import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_state.dart';
import 'package:weather_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:(context)=> BlocBuilder<GetWeatherCubit, WeatherState>(
  builder: (context, state) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModle?.weatherContion)
          ),
          home: const HomeScreen(),
        );
  },
),
      ),
    );
  }
  }

MaterialColor getThemeColor(String? condition) {
  if (condition==null) {
    return Colors.blue;
  } else {
    switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.indigo;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Light rain shower':
      return Colors.lightGreen;
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate or heavy rain shower':
      return Colors.green;
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Torrential rain shower':
      return Colors.teal;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Light snow showers':
      return Colors.grey;
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Moderate or heavy snow showers':
      return Colors.blue;
    case 'Heavy snow':
    case 'Patchy heavy snow':
    case 'Moderate or heavy snow with thunder':
      return Colors.indigo;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Light sleet showers':
      return Colors.lightBlue;
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
      return Colors.cyan;
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.deepPurple;
    case 'Blizzard':
      return Colors.deepOrange;
    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
      return Colors.yellow;
    case 'Fog':
    case 'Freezing fog':
      return Colors.brown;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    default:
      return Colors.blue;
  }
  }
}
