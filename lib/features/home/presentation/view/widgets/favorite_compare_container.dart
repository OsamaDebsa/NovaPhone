import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/styles.dart';

class FavoriteCompareContainer extends StatelessWidget {
  const FavoriteCompareContainer(
      {super.key,
      required this.onTab,
      required this.child,
      required this.title});
  final VoidCallback onTab;
  final Widget? child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: child)),
            const SizedBox(height: 12),
            FittedBox(
              child: Text(
                title,
                style: Styles.styleBold16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
