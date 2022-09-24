import 'package:gweather/logic/helpers.dart';
import 'package:gweather/data/weather_code_to_name.dart';

class Weather {
  const Weather({
    required this.sunset,
    required this.sunrise,
    required this.windSpeed,
    required this.temperature,
    required this.weatherName,
    required this.dailyMaxTemp,
    required this.dailyMinTemp,
    required this.humidityRank,
  });

  final DateTime sunset;
  final DateTime sunrise;
  final double windSpeed;
  final double temperature;
  final double dailyMaxTemp;
  final double dailyMinTemp;
  final double humidityRank;
  final String weatherName;

  static Weather fromJson(
    Map<String, dynamic> json, {
    required int pastDays,
    int? dayIndex, // The index of the day to get
  }) {
    int daysToGet = 7;
    int todayIndex = dayIndex ?? (daysToGet + pastDays) - daysToGet;
    int currentHourNumber = (dayIndex ?? todayIndex * 24) + DateTime.now().hour;

    return Weather(
      sunset: timestampToDateTime(json['daily']['sunset'][todayIndex]),
      sunrise: timestampToDateTime(json['daily']['sunrise'][todayIndex]),
      windSpeed: json['hourly']['windspeed_10m'][currentHourNumber],
      weatherName: weatherCodeToName(json['hourly']['weathercode'][currentHourNumber].round()),
      temperature: json['hourly']['temperature_2m'][currentHourNumber],
      dailyMaxTemp: json['daily']['temperature_2m_max'][todayIndex],
      dailyMinTemp: json['daily']['temperature_2m_min'][todayIndex],
      humidityRank: json['hourly']['relativehumidity_2m'][currentHourNumber],
    );
  }
}
