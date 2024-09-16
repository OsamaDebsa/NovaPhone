import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.backgroundColor});
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: ColorManager.whiteColor,
          ),
        ),
      ),
    );
  }
}
