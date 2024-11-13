import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_yoga_mat_app/screens/home_screen.dart';
import 'package:smart_yoga_mat_app/screens/connection_screen.dart';
import 'package:smart_yoga_mat_app/screens/control_screen.dart';
import 'package:smart_yoga_mat_app/screens/music_screen.dart';
import 'package:smart_yoga_mat_app/screens/product_showcase_screen.dart';
import 'package:smart_yoga_mat_app/screens/ota_update_screen.dart';
import 'package:smart_yoga_mat_app/screens/analytics_screen.dart';

import 'providers/device_provider.dart';
import 'providers/product_provider.dart';
import 'providers/ota_update_provider.dart';
import 'providers/music_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeviceProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => OTAUpdateProvider()),
        ChangeNotifierProvider(create: (_) => MusicProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // Handle connection status change
  void onConnectionChange(bool isConnected) {
    // Handle connection status change (e.g., update UI or state)
    print(isConnected ? 'Connected to the mat' : 'Disconnected from the mat');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Yoga Mat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set up initial route and named routes
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/connection': (context) => ConnectionScreen(onConnectionChange: onConnectionChange),
        '/control': (context) => ControlScreen(),
        '/music': (context) => MusicScreen(),
        '/product_showcase': (context) => ProductShowcaseScreen(),
        '/ota_update': (context) => OtaUpdateScreen(),
        '/analytics': (context) => AnalyticsScreen(),
      },
    );
  }
}
