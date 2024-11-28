import 'package:final_project/privacy_&_policy.dart';
import 'package:final_project/terms_&_conditions.dart';
import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'signup.dart';
import 'signin.dart';
import 'forgot_password.dart';

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
        'signup': (context) => SignUpScreen(), 
        'signin': (context) => SignInScreen(), 
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/terms': (context) => TermsAndConditionsScreen(), 
        '/privacy': (context) => PrivacyPolicyScreen(), 
      },
    );
  }
}


