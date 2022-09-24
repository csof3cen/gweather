import 'home_body.dart';
import 'package:flutter/material.dart';
import 'package:gweather/config/const.dart';
import 'package:gweather/models/weather.dart';
import 'package:gweather/logic/fetch_data.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';

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
    Stream<bool> stream = InternetConnectivity()
        .isConnectedToInternet(intervalInMilliseconds: 1000);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldBg,
        colorScheme: const ColorScheme.dark(),
      ),
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.vertical + kPadding,
            horizontal: kPadding,
          ),
          child: FutureBuilder<Weather>(
            future: weatherFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Weather weather = snapshot.data!;
                return StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && (snapshot.data as bool) == true) {
                      return HomeScreenBody(weather: weather);
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(kPadding),
                          decoration: BoxDecoration(
                            color: const Color(0XFF1f2b47),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Text(
                            'Veuillez vérifiez l\'accès à internet pour continuer.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      );
                    }
                  },
                );
              } else if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
