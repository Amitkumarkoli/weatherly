import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherly/utils/location_services.dart';

class WeatherService {
  static const String apiKey = "f14f4e35ac263ff9e82542032c733b09";

  static Future<Map<String, dynamic>?> getWeather() async {
    final location = await LocationService.getUserLocation();
    if (location == null) return null;

    String url = "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
