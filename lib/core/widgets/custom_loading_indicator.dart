import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: ColorManager.secondaryColor),
    );
  }
}
