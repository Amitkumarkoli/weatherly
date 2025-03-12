import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/core/provider/auth_provider.dart';
import 'package:weatherly/core/provider/navigation_provider.dart';
import 'package:weatherly/core/provider/weather_provider.dart';
import 'package:weatherly/presentation/screens/favorite_screen.dart';
import 'package:weatherly/presentation/screens/profile_screen.dart';
import 'package:weatherly/presentation/screens/search_screen.dart';
import 'package:weatherly/presentation/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final navigationProvider = Provider.of<NavigationProvider>(context);

    final List<Widget> pages = [
      const WeatherHomeScreen(),
      const SearchScreen(),
      const FavoriteScreen(),
      const ProfileScreen(),
    ];

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
      body: pages[navigationProvider.currentIndex], 
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return weatherProvider.isLoading
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
              );
  }
}
