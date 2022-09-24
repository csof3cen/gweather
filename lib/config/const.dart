import 'package:flutter/material.dart';
import 'package:gweather/config/route.dart';
import 'package:gweather/views/screens/home/home_screen.dart';

// Colors
Color kScaffoldBg = const Color(0XFF121D3B);

// Strings
const name = '';

// Routes
Map<String, Widget Function(BuildContext)> routes = {
  homeScreenRoute: (context) => const HomeScreen(),
};

// Sizes
double kPadding = 20;
