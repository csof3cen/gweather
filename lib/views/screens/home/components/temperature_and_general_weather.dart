import 'package:flutter/material.dart';
import 'package:gweather/config/const.dart';
import 'package:gweather/models/weather.dart';

class TemperatureAndGeneralWeather extends StatelessWidget {
  const TemperatureAndGeneralWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.05,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kPadding * 2),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0XFF28334e),
                    Color(0XFF172340),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Center(
                child: Image.asset('assets/icons/weather-icons/hail 0.png'),
              ),
            ),
          ),
          SizedBox(width: kPadding),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
                      color: const Color(0Xff85b4ea),
                    ),
                    children: [
                      TextSpan(
                        text: weather.temperature.toString().replaceAll('.', ','),
                      ),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Text(
                          '°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0Xff85b4ea),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: kPadding / 2),
                Text(
                  weather.weatherName,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
