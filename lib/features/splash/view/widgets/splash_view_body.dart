import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:nova_phone/core/utils/assets.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/size_config.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/core/ad/app_ad.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fedingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    fedingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    goToNextView();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              repeat: false,
              Assets.assetsLogo,
            ),
          ),
          FadeTransition(
            opacity: fedingAnimation!,
            child: Text(StringManager.novaPhone,
                style: Styles.styleHeavy30.copyWith(
                  color: ColorManager.secondaryColor,
                )),
          ),
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (mounted) {
          // Check if the widget is still in the tree
          AppAd().showAppOpenAd();
          context.push(StringManager.homeRoute);
        }
      },
    );
  }
}
