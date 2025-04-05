import 'package:flutter/material.dart';
import 'package:weatherly/data/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  WeatherProvider() {
    fetchWeather(); // this fetches weather for current location on start
  }

  Future<void> fetchWeather() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await WeatherService.getWeather();
      weatherData = data;
    } catch (e) {
      weatherData = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> getWeatherForCity(String cityName) async {
    try {
      return await WeatherService.getWeatherByCity(cityName);
    } catch (_) {
      return null;
    }
  }
}
