import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIcon(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () {
              Navigator.pop(context);
            },
            backgroundColor: ColorManager.mainColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                title,
                style: Styles.styleMedium20
                    .copyWith(color: ColorManager.mainColor),
              ),
            ),
          ),
        ),
        CustomIcon(
            icon: Icons.search,
            onTap: () {
              AppAd().showInterstitialAd();
              context.push(StringManager.searchViewRoute);
            },
            backgroundColor: ColorManager.mainColor),
      ],
    );
  }
}
