import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
    required this.style,
  });
  final String text;
  final Gradient gradient;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        text,
        style: style.copyWith(
          color: Colors.white, // Text color should be white or transparent
        ),
      ),
    );
  }
}
