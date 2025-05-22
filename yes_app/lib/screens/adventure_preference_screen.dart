import 'package:flutter/material.dart';
import '../core/widgets/animated_gradient_background.dart';

class AdventurePreferenceScreen extends StatelessWidget {
  const AdventurePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'AdventurePreferenceScreen',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
