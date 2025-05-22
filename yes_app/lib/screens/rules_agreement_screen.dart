import 'package:flutter/material.dart';
import '../core/widgets/animated_gradient_background.dart';

class RulesAgreementScreen extends StatelessWidget {
  const RulesAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'RulesAgreementScreen',
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
