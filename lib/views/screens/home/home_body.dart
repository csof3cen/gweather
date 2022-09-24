import 'package:flutter/material.dart';
import 'components/detailed_weather.dart';
import 'components/date_and_location.dart';
import 'package:gweather/config/const.dart';
import 'package:gweather/models/weather.dart';
import 'components/temperature_and_general_weather.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Column(
      children: [
        DateAndLocation(today: today),
        SizedBox(height: kPadding),
        TemperatureAndGeneralWeather(weather: weather),
        SizedBox(height: kPadding),
        DetailedWeather(weather: weather),
      ],
    );
  }
}
