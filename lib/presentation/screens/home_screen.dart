import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/core/provider/auth_provider.dart';
import 'package:weatherly/core/provider/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weatherly')),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authProvider.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
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
                    ],
                  ),
                ),
    );
  }
}
