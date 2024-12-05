import 'package:final_project/home.dart';
import 'package:final_project/privacy_&_policy.dart';
import 'package:final_project/terms_&_conditions.dart';
import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'signup.dart';
import 'signin.dart';
import 'forgot_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'onboarding': (context) => OnboardingScreen(),
        'signup': (context) => SignUpScreen(), 
        'signin': (context) => SignInScreen(), 
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/terms': (context) => TermsAndConditionsScreen(), 
        '/privacy': (context) => PrivacyPolicyScreen(), 
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginState();
  }

  Future<void> _checkLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, 'onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), 
      ),
    );
  }
}
