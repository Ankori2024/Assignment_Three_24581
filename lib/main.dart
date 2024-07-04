import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:app_dev/auth_service.dart';
import 'package:app_dev/battery_service.dart';
import 'package:app_dev/connectivity_service.dart';
import 'package:app_dev/theme_service.dart';
import 'package:app_dev/welcome_screen.dart';
import 'package:app_dev/sign_in_screen.dart';
import 'package:app_dev/sign_up_screen.dart';
import 'package:app_dev/calculator_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ConnectivityService();
  BatteryService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeService(),
      child: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeService.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: WelcomeScreen(),
            routes: {
              '/signin': (context) => SignInScreen(),
              '/signup': (context) => SignUpScreen(),
              '/calculator': (context) => CalculatorScreen(),
            },
          );
        },
      ),
    );
  }
}
