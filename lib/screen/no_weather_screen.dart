import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('There Is On Weather Please Start Search Now'
      ,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          fontFamily: 'Merienda'
        ),)),
    );
  }
}
