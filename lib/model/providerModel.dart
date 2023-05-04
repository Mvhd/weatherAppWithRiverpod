import 'dart:convert';
import 'package:flutterweatherapp/model/weatherApiModel.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'constants/apikey.dart';

final weatherProvider = FutureProvider<Weather>((ref) async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=London&appid='+apiKey));
  //print(response.body);
  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
});


