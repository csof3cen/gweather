import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gweather/models/weather.dart';

Future<Weather> fetchWeather() async {
  final response = await http.get(
    Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=14.75&longitude=-17.37&hourly=temperature_2m,relativehumidity_2m,rain,weathercode,windspeed_10m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timeformat=unixtime&timezone=auto&past_days=2',
    ),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body), pastDays: 2);
  } else {
    throw Exception('Failed to load weather data');
  }
}
