import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedArrow extends StatelessWidget {
  final double direction; // in degrees (0, 90, 180, 270)
  final double size;
  final Color color;

  const AnimatedArrow({
    Key? key,
    required this.direction,
    this.size = 50,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert degrees to radians for rotation
    final double radians = direction * math.pi / 180;

    return Transform.rotate(
      angle: radians,
      child: Icon(
        Icons.arrow_upward,
        color: color,
        size: size,
      ),
    );
  }
}
