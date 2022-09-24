import 'package:flutter/material.dart';
import 'package:gweather/models/weather.dart';
import 'package:gweather/logic/fetch_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Weather> weatherFuture;

  @override
  void initState() {
    weatherFuture = fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: weatherFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text('Température : ${snapshot.data!.temperature}'),
              Text('Sunrise : ${snapshot.data!.sunrise.hour}'),
            ],
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.error.toString());
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
