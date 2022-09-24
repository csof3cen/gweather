import 'package:flutter/material.dart';
import 'components/sunset_sunrise.dart';
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

    return SingleChildScrollView(
      child: Column(
        children: [
          DateAndLocation(today: today),
          SizedBox(height: kPadding * 3),
          TemperatureAndGeneralWeather(weather: weather),
          SizedBox(height: kPadding * 2),
          DetailedWeather(weather: weather),
          SizedBox(height: kPadding * 2),
          SunsetSunrise(weather: weather),
        ],
      ),
    );
  }
}
