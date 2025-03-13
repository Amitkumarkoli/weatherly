import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/core/provider/navigation_provider.dart';
import 'package:weatherly/presentation/screens/home_screen.dart';
import 'package:weatherly/presentation/screens/search_screen.dart';
import 'package:weatherly/presentation/screens/favorite_screen.dart';
import 'package:weatherly/presentation/screens/setting_screen.dart';
import 'package:weatherly/presentation/widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> _pages = const [
    HomeScreen(),
    FavoriteScreen(),
    SearchScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: navigationProvider.currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
