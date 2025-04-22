import 'package:flutter/material.dart';

/// A reusable animated gradient background for all screens.
class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation1;
  late final Animation<Color?> _colorAnimation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation1 = ColorTween(
      begin: Colors.purple,
      end: Colors.blue,
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: Colors.orange,
      end: Colors.pink,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _colorAnimation1.value ?? Colors.purple,
                _colorAnimation2.value ?? Colors.orange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}