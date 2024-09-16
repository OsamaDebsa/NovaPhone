import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = ColorManager.secondaryColor,
    this.elevation = 2.0,
  });
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        elevation: WidgetStateProperty.all(elevation),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: Styles.styleBold16,
        ),
      ),
    );
  }
}
