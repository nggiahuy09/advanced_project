import 'package:advanced_project/presentation/resources/routes_manager.dart';
import 'package:advanced_project/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

// note: use Singleton Pattern to create the application
class MyApp extends StatefulWidget {
  const MyApp._();
  static const MyApp instance = MyApp._();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRouted,
      // initialRoute: Routes.splashRoute,
      initialRoute: Routes.onBoardingRoute,
      theme: getApplicationTheme(),
    );
  }
}
