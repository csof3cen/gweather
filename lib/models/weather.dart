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
  }) {
    int daysToGet = 7;
    int todayIndex = (daysToGet + pastDays) - daysToGet;
    // int totalDays = daysToGet + pastDays;
    // int totalHours = totalDays * 24;
    int currentHourNumber = (todayIndex * 24) + DateTime.now().hour;

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

DateTime timestampToDateTime(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}

String weatherCodeToName(int code) {
  Map<int, String> wmoWeatherInterpretationCodes = {
    0: 'Ciel dégagé',
    1: 'Ciel principalement clair',
    2: 'Ciel partiellement nuageux,',
    3: 'Ciel sombre',
    45: 'Brouillard',
    48: 'Dépôt de brouillard givré',
    51: 'Bruine légère',
    53: 'Bruine modéré',
    55: 'Bruine modérée et dense',
    56: 'Bruine verglaçante légère',
    57: 'Bruine verglaçante dense',
    61: 'Pluie faible',
    63: 'Pluie modérée',
    65: 'Forte pluie',
    66: 'Pluie verglaçante légère',
    67: 'Pluie verglaçante forte',
    71: 'Chute de neige légère',
    73: 'Chute de neige modérée',
    75: 'Forte chute de neige',
    77: 'Grains de neige',
    80: 'Averses de pluie légères',
    81: 'Averses de pluie modérées',
    82: 'Averses de pluie violentes',
    85: 'Averses de neige légères',
    86: 'Averses de neige fortes',
    95: 'Orage léger ou modéré',
    96: 'Orage avec grêle légère',
    99: 'Orage avec grêle forte',
  };

  return wmoWeatherInterpretationCodes[code]!;
}
