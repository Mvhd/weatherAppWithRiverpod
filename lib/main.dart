import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterweatherapp/view/myWeatherHome.dart';

void main() {
  runApp(const ProviderScope(child: MyWeatherApp()));
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWeatherHome()
    );
  }
}



