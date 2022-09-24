import 'package:flutter/material.dart';
import 'package:gweather/config/const.dart';
import 'package:gweather/config/route.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: homeScreenRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
