class Weather {
  const Weather({
    required this.windSpeed,
    required this.temperature,
    required this.weatherName,
    required this.dailyMaxTemp,
    required this.dailyMinTemp,
    required this.humidityRank,
  });

  final double windSpeed;
  final double temperature;
  final double dailyMaxTemp;
  final double dailyMinTemp;
  final double humidityRank;
  final WeatherState weatherName;

  Weather fromJson(Map<String, dynamic> json) {
    return Weather(
      windSpeed: json[''],
      weatherName: json[''],
      temperature: json[''],
      dailyMaxTemp: json[''],
      dailyMinTemp: json[''],
      humidityRank: json[''],
    );
  }
}

enum WeatherState { pluie, soleil, grandVent, petitVent, canicule }

String weatherStateToString(WeatherState weatherState) {
  Map<WeatherState, String> weatherToString = {
    WeatherState.pluie: 'Pluie',
    WeatherState.canicule: 'Canicule',
  };

  return weatherToString[weatherState]!;
}
