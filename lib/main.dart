import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'screens/wordle_game_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {
    await FirebaseAnalytics.instance.logAppOpen();
  } catch (e) {
    print('Ошибка при отправке события аналитики: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steel Grade Wordle - ГОСТ',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 245, 222, 165),
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 222, 165),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'PT Sans', color: Colors.black87),
          bodyMedium: TextStyle(fontFamily: 'PT Sans', color: Colors.black87),
          titleLarge: TextStyle(fontFamily: 'PT Sans', fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      home: WordleGameScreen(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
