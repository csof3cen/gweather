import 'package:flutter/material.dart';
import 'package:gweather/config/route.dart';
import 'package:gweather/views/screens/home/home_screen.dart';

const name = '';
Map<String, Widget Function(BuildContext)> routes = {
  homeScreenRoute: (context) => const HomeScreen(),
};
