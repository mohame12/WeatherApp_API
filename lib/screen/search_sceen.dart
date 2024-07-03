import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final TextEditingController controller=TextEditingController();


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2395F1
              ),
            )
        ),
      ),
      body:

      Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1,),
            TextFormField(
              onFieldSubmitted:(city)
              {
                var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(city: city);
                Navigator.pop(context);
              },
              controller: controller,

              decoration: const InputDecoration(

                suffixIcon: Icon(Icons.search
                ,),
                labelText: 'Search',
                    hintText: 'Search By City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
              ),
            ),
            const Spacer(flex: 6,)
          ],
        ),
      )
      ,);
  }
}
