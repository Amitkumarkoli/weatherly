import 'package:flutter/material.dart';
import 'package:weatherly/data/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  WeatherProvider() {
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    weatherData = await WeatherService.getWeather();
    isLoading = false;
    notifyListeners();
  }
}
