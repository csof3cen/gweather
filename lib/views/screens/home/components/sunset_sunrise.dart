import 'package:flutter/material.dart';
import 'package:gweather/config/const.dart';
import 'package:gweather/models/weather.dart';

class SunsetSunrise extends StatelessWidget {
  const SunsetSunrise({
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
                Container(
                  padding: EdgeInsets.all(kPadding * 2),
                  child: Image.asset('assets/icons/weather-icons/soleil.png'),
                ),
                Text(
                  '${weather.sunrise.hour}h${weather.sunrise.minute}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
                  ),
                ),
                const Text(
                  'Lever du soleil',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(kPadding * 2),
                  child: Image.asset('assets/icons/weather-icons/lune.png'),
                ),
                Text(
                  '${weather.sunset.hour}h${weather.sunset.minute}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
                  ),
                ),
                const Text(
                  'Coucher du soleil',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
