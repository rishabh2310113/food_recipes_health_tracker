import 'package:flutter/material.dart';
import 'onboarding.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'onboarding',
      routes: {
        'onboarding': (context) => OnboardingScreen(),
      },
    );
  }
}


