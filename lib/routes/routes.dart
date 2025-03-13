import 'package:flutter/material.dart';
import 'package:weatherly/presentation/screens/main_screen.dart';
import 'package:weatherly/presentation/screens/login_screen.dart';
import 'package:weatherly/presentation/screens/home_screen.dart';
import 'package:weatherly/presentation/screens/search_screen.dart';
import 'package:weatherly/presentation/screens/favorite_screen.dart';
import 'package:weatherly/presentation/screens/setting_screen.dart';

class AppRoutes {
  static const String main = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String favorite = '/favorite';
  static const String search = '/search';
  static const String setting = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("404: Page Not Found")),
          ),
        );
    }
  }
}
