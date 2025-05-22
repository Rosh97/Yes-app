import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_gradient_background.dart';
import '../core/text_styles.dart';

class SignupOptionsScreen extends StatelessWidget {
  const SignupOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                // Top part: YES Logo Centered
                Expanded(
                  child: Center(
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
                // Bottom part: Buttons and login link
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      _buildSignupButton(
                        icon: Icons.apple,
                        text: "Sign up with Apple",
                        onPressed: () {
                          Navigator.pushNamed(context, '/home'); // dev shortcut
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildSignupButton(
                        icon: Icons.g_mobiledata,
                        text: "Sign up with Google",
                        onPressed: () {
                          Navigator.pushNamed(context, '/home'); // dev shortcut
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildSignupButton(
                        icon: Icons.email,
                        text: "Sign up with Email",
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup-email');
                        },
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          "Login Existing User?",
                          style: AppTextStyles.linkText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.9),
        foregroundColor: Colors.black,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}