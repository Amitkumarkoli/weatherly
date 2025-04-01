import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/core/provider/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weatherly')),
      ),
      body: weatherProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : weatherProvider.weatherData == null
              ? const Center(child: Text("Failed to load weather"))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://openweathermap.org/img/wn/${weatherProvider.weatherData!['weather'][0]['icon']}@4x.png",
                      ),
                      Text(
                        "${weatherProvider.weatherData!['main']['temp']}°C",
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(
                        "${weatherProvider.weatherData!['weather'][0]['description']}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          weatherProvider
                              .fetchWeather(); 
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Refresh Weather"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
