import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.page,
    required this.isSelected,
  });

  final bool isSelected;
  final int page;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor:
          isSelected ? ColorManager.secondaryColor : ColorManager.darkGrayColor,
      child: Center(
        child: FittedBox(
          child: Text(
            '$page',
            style: const TextStyle(
              color: ColorManager.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
