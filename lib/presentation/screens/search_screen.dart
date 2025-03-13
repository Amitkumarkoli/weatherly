import 'package:flutter/material.dart';
import 'package:weatherly/presentation/widgets/bottom_nav_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Controller for the search text field.
  final TextEditingController _searchController = TextEditingController();

  // Dummy list of suggestions.
  final List<String> _searchSuggestions = [
    "New York",
    "Los Angeles",
    "Chicago",
    "London",
    "Tokyo",
    "Paris",
    "Dubai",
  ];

  // This list holds the filtered results.
  List<String> _searchResults = [];

  // Called whenever the search input changes.
  void _onSearchChanged() {
    setState(() {
      // Filter suggestions based on the entered text (ignoring case).
      _searchResults = _searchSuggestions
          .where((item) =>
              item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    // Always dispose controllers to free up resources.
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Each screen can have its own AppBar.
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          // Search Bar with padding.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search location...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // Show clear button only when there is some text.
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
              onChanged: (value) => _onSearchChanged(),
            ),
          ),
          // Display search results (or a "no results" message).
          Expanded(
            child: _searchResults.isEmpty
                ? const Center(child: Text("No results found"))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_searchResults[index]),
                        onTap: () {
                          // Optionally, set the tapped result as the search text.
                          setState(() {
                            _searchController.text = _searchResults[index];
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
