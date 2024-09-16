import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/assets.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';

class CustomCompareImage extends StatelessWidget {
  const CustomCompareImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(StringManager.rewardedVideoAdRoute,
            extra: StringManager.compareViewRoute);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: ColorManager.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  StringManager.compare,
                  style: Styles.styleHeavy30,
                ),
              ),
              Image.asset(Assets.assetsVs),
            ],
          ),
        ),
      ),
    );
  }
}
