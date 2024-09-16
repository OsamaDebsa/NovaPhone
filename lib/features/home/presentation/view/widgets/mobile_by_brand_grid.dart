import 'package:flutter/material.dart';
import 'package:nova_phone/features/home/data/models/device_by_brand_model/device_list.dart';
import 'package:nova_phone/features/home/data/models/mobile_model.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/background_mobile_item_container.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobile_item.dart';

class MobileByBrandGrid extends StatelessWidget {
  const MobileByBrandGrid({
    super.key,
    required this.deviceList,
    required this.onTap,
  });
  final List<DeviceList>? deviceList;
  final void Function(BuildContext, int) onTap;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final mobile = deviceList?[index];
          return BackgroundMobileItemContainer(
            child: GestureDetector(
              onTap: () {
                AppAd().showInterstitialAd();
                onTap(context, index);
              },
              child: MobileItem(
                mobileModel: MobileModel(
                  imageUrl: mobile?.deviceImage ?? '',
                  title: mobile?.deviceName ?? '',
                  mobileKey: mobile?.key ?? '',
                ),
              ),
            ),
          );
        },
        childCount: deviceList?.length ?? 0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
    );
  }
}
