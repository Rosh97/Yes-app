import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_gradient_background.dart';
import 'signup_options_screen.dart';

/// Splash Intro screen with animated gradient and YES logo.
class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSignup();
  }

  void _navigateToSignup() async {
    await Future.delayed(const Duration(seconds: 5)); // wait 3 seconds
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignupOptionsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'YES',
            style: GoogleFonts.hanaleiFill(
              fontSize: 78,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 4,
            ),
          ),
        ),
      ),
    );
  }
}