import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/core/provider/auth_provider.dart';
import 'package:weatherly/core/provider/navigation_provider.dart';
import 'package:weatherly/core/provider/weather_provider.dart';
import 'package:weatherly/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: const MaterialApp(
        title: 'Weatherly',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.main,
      ),
    );
  }
}
