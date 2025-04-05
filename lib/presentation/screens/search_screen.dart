import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/core/provider/weather_provider.dart';
import 'package:weatherly/presentation/screens/weather_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchSuggestions = [
    "New York",
    "Los Angeles",
    "Chicago",
    "London",
    "Tokyo",
    "Paris",
    "Dubai",
  ];
  List<String> _searchResults = [];

  void _onSearchChanged() {
    setState(() {
      _searchResults = _searchSuggestions
          .where((item) => item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showWeatherForCity(String cityName) async {
    final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);

    final weatherData = await weatherProvider.getWeatherForCity(cityName);
    if (weatherData != null) {
      // Navigate to detail screen and pass weather data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherDetailScreen(cityName: cityName, weatherData: weatherData),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch weather for this location.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Location"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search location...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchResults.clear();
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (_) => _onSearchChanged(),
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? const Center(child: Text("No results found"))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final cityName = _searchResults[index];
                      return ListTile(
                        title: Text(cityName),
                        onTap: () => _showWeatherForCity(cityName),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
