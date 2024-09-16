import 'package:flutter/widgets.dart';
import 'package:nova_phone/core/utils/color_manager.dart';

class CustomItemResultContainer extends StatelessWidget {
  const CustomItemResultContainer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.mainColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: ColorManager.mainColor.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
