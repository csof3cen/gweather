import 'package:flutter/material.dart';
import 'package:gweather/config/const.dart';
import 'package:gweather/config/route.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting();
  runApp(const App());
}

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
