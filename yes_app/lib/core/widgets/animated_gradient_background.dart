import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with TickerProviderStateMixin {
  final List<_BlobConfig> blobs = [];
  final List<AnimationController> controllers = [];
  final List<Animation<Offset>> animations = [];

  @override
  void initState() {
    super.initState();

    blobs.addAll([
      // Top-left cloud (purple + blue)
      _BlobConfig(color: const Color(0xFF5200FF), size: 500, begin: const Offset(-0.6, -0.6), end: const Offset(-0.5, -0.4), duration: 40),
      _BlobConfig(color: const Color(0xFF0223CE), size: 450, begin: const Offset(-0.5, -0.5), end: const Offset(-0.4, -0.3), duration: 42),

      // Center cloud (purple + pink)
      _BlobConfig(color: const Color(0xFFB388FF), size: 480, begin: const Offset(0.3, 0.3), end: const Offset(0.4, 0.4), duration: 38),
      _BlobConfig(color: const Color(0xFFFFC1E3), size: 420, begin: const Offset(0.2, 0.4), end: const Offset(0.3, 0.5), duration: 41),

      // Bottom-right cloud (blue + teal)
      _BlobConfig(color: const Color(0xFF0223CE), size: 470, begin: const Offset(0.9, 1.0), end: const Offset(0.8, 0.9), duration: 39),
      _BlobConfig(color: const Color(0xFF80DEEA), size: 430, begin: const Offset(1.0, 0.8), end: const Offset(0.9, 0.7), duration: 37),
    ]);

    for (final blob in blobs) {
      final controller = AnimationController(
        duration: Duration(seconds: blob.duration),
        vsync: this,
      )..repeat(reverse: true);

      final animation = Tween<Offset>(
        begin: blob.begin,
        end: blob.end,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

      controllers.add(controller);
      animations.add(animation);
    }
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildBlob(_BlobConfig config, Animation<Offset> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return FractionalTranslation(
          translation: animation.value,
          child: Container(
            width: 0,
            height: 0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: config.color.withOpacity(0.35),
                  blurRadius: config.size,
                  spreadRadius: config.size * 0.6,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: Stack(
        children: [
          for (int i = 0; i < blobs.length; i++) _buildBlob(blobs[i], animations[i]),
          Positioned.fill(child: widget.child),
        ],
      ),
    );
  }
}

class _BlobConfig {
  final Color color;
  final double size;
  final Offset begin;
  final Offset end;
  final int duration;

  _BlobConfig({
    required this.color,
    required this.size,
    required this.begin,
    required this.end,
    required this.duration,
  });
}
