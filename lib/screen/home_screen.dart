import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_state.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screen/get_weather_data.dart';
import 'package:weather_app/screen/no_weather_screen.dart';
import 'package:weather_app/screen/search_sceen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var weathermodel=BlocProvider.of<GetWeatherCubit>(context).weatherModle;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: getThemeColor(weathermodel?.weatherContion),
        elevation: 0,

        title: const Text('W E A T H E R',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,),),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));
            },
                icon:const Icon(Icons.search,color:Colors.black ,) ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(builder: (context, state) {
        if(state is initialState)
          {return const NoWeather();}
        else if(state is WeatherloadedCubitState)
          {return const GetWeatherData();}
        else {return const Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(child: Text('Opps,There Are An Errors ')),
        );}
      }, ),
    );
  }
}
