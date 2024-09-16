import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';

class BackgroundMobileItemContainer extends StatelessWidget {
  const BackgroundMobileItemContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.whiteColor,
          ),
          child: child),
    );
  }
}
