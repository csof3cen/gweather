import 'package:flutter/material.dart';
import 'package:gweather/config/const.dart';
import 'package:gweather/models/weather.dart';
import 'package:gweather/views/components/vertical_divider.dart';

class DetailedWeather extends StatelessWidget {
  const DetailedWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kPadding / 1.5),
      decoration: BoxDecoration(
        color: const Color(0XFF1f2b47),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Vent',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kPadding / 4),
                Text(
                  '${weather.windSpeed.round()} Km/h',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const VericalDivider(),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Temp.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kPadding / 4),
                Text(
                  '${weather.temperature.round()} °C',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const VericalDivider(),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Humidité',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kPadding / 4),
                Text(
                  '${weather.humidityRank.round()} %',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
