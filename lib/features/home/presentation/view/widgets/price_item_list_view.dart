import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/core/widgets/custom_image_display.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/phone_memory_price.dart';

class PriceItemListView extends StatelessWidget {
  const PriceItemListView({super.key, required this.price});
  final PhoneMemoryPrice price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppAd().showInterstitialAd();
        context.push(StringManager.webViewRoute, extra: price.buyUrl ?? '');
      },
      child: Container(
        height: 100,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: ColorManager.whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageDisplay(
                    imageUrl: price.shopImage ?? '',
                  ),
                ),
              ),
              Text(
                price.price ?? '',
                style: Styles.styleBold20,
                maxLines: 2,
              ),
              const Text(
                StringManager.buyNow,
                style: Styles.styleBold14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
