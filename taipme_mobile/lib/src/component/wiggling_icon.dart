import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WigglingIcon extends ConsumerStatefulWidget {
  const WigglingIcon({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WigglingIconState();
}

class _WigglingIconState extends ConsumerState<WigglingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;
  final double maxRotationDegrees = 35.0;

  @override
  void initState() {
    super.initState();

    final double maxRotationRadians = maxRotationDegrees * math.pi / 180.0;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _angleAnimation = Tween<double>(
      begin: -maxRotationRadians,
      end: maxRotationRadians,
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
      animation: _angleAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _angleAnimation.value,
          child: child, 
        );
      },
      child: Transform.rotate(
        angle: 70,
        child: Image.asset(
          'assets/logo/swiper.png', 
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
