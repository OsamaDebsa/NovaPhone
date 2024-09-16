import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: ShapeDecoration(
              color: ColorManager.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              shadows: const [
                BoxShadow(
                  color: ColorManager.shadowBordrColor,
                  blurRadius: 20,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                AppAd().showInterstitialAd();
                context.push(StringManager.searchViewRoute);
              },
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Icon(
                      Icons.search,
                      color: ColorManager.secondaryColor,
                    ),
                  ),
                  Text(
                    StringManager.search,
                    style: Styles.styleMedium16,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        CustomIcon(
          icon: Icons.star_border_purple500_rounded,
          onTap: () {
            context.push(StringManager.rewardedVideoAdRoute,
                extra: StringManager.favoritesViewRoute);
          },
          backgroundColor: ColorManager.secondaryColor,
        ),
      ],
    );
  }
}
