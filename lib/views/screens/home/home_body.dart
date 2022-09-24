import 'package:flutter/material.dart';
import 'package:gweather/models/weather.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Température : ${weather.temperature}'),
        Text('Sunrise : ${weather.sunrise.hour}'),
      ],
    );
  }
}
