import 'package:flutter/material.dart';
import 'package:yes_app/screens/intro_screen.dart';
import 'package:yes_app/screens/signup_options_screen.dart';
import 'package:yes_app/screens/email_signup_screen.dart';
import 'package:yes_app/screens/user_info_screen.dart';
import 'package:yes_app/screens/id_verification_screen.dart';
import 'package:yes_app/screens/thank_you_screen.dart';
import 'package:yes_app/screens/login_screen.dart';
import 'package:yes_app/screens/adventure_preference_screen.dart';
import 'package:yes_app/screens/payment_screen.dart';
import 'package:yes_app/screens/rules_agreement_screen.dart';
import 'package:yes_app/screens/home_map_screen.dart';

void main() {
  runApp(const YesApp());
}

class YesApp extends StatelessWidget {
  const YesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'YourCustomFont', // Optional: Replace with actual font
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/signup-options': (context) => const SignupOptionsScreen(),
        '/signup-email': (context) => const EmailSignupScreen(),
        '/signup-info': (context) => const UserInfoScreen(),
        '/signup-id': (context) => const IDVerificationScreen(),
        '/thank-you': (context) => const ThankYouScreen(),
        '/login': (context) => const LoginScreen(),
        '/preferences': (context) => const AdventurePreferenceScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/rules': (context) => const RulesAgreementScreen(),
        '/home': (context) => const HomeMapScreen(),
      },
    );
  }
}