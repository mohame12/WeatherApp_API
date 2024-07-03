import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
class GetWeatherData extends StatelessWidget {
  const GetWeatherData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherdata=BlocProvider.of<GetWeatherCubit>(context).weatherModle!;

    return
       Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(colors: [getThemeColor(weatherdata.weatherContion),
             getThemeColor(weatherdata.weatherContion)[300]!,
             getThemeColor(weatherdata.weatherContion)[50]!],
           begin:Alignment.topCenter ,end:Alignment.bottomCenter )
         ),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3,),
            Center(child: Text(weatherdata.city,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0,fontFamily: 'Merienda'),)),
            const SizedBox(height: 10.0,),
            Text('Updated at ${weatherdata.date.hour}:${weatherdata.date.minute}',style: const TextStyle(fontSize:20 ,fontFamily: 'Merienda'),),
            const Spacer(flex: 1,),
             Expanded(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1,),
                  Image(image: NetworkImage('https:${weatherdata.image}'),),
                  const Spacer(flex: 1,),
                  Text('${weatherdata.temp.round()}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Merienda'),),
                  const Spacer(flex: 1,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Max Temp :${weatherdata.maxtemp.round()}',style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Merienda'),),
                      Text('Min Temp :${weatherdata.mintemp.round()}',style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Merienda'),),
                    ],
                  ),
                  const Spacer(flex: 1,),
                ],
                         ),
             ),
            const Spacer(flex: 1,),
            Text(weatherdata.weatherContion,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Merienda'),),
            const Spacer(flex: 3,),



          ],

             ),
       );
  }
}