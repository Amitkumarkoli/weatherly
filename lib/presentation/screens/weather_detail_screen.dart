import 'package:flutter/material.dart';

class WeatherDetailScreen extends StatelessWidget {
  final String cityName;
  final Map<String, dynamic> weatherData;

  const WeatherDetailScreen({
    super.key,
    required this.cityName,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    final weather = weatherData['weather'][0];
    final main = weatherData['main'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in $cityName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://openweathermap.org/img/wn/${weather['icon']}@4x.png",
            ),
            Text(
              "${main['temp']}°C",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              weather['description'],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              "Humidity: ${main['humidity']}%",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Pressure: ${main['pressure']} hPa",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Min: ${main['temp_min']}°C | Max: ${main['temp_max']}°C",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
