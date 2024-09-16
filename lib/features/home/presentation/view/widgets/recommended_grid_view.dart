import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/features/home/data/models/mobile_model.dart';
import 'package:nova_phone/features/home/data/models/recommended_model/datum.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/background_mobile_item_container.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_grid_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobile_item.dart';

class RecommendedGridView extends StatelessWidget {
  const RecommendedGridView({
    super.key,
    required this.recommendedList,
    this.itemCount,
  });

  final List<Datum>? recommendedList;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      // scrollable: true,
      itemCount: itemCount ?? (recommendedList?.length ?? 0),
      gridItem: (context, index) {
        final datum = recommendedList?[index];
        if (datum == null) {
          return const SizedBox.shrink();
        }
        return GestureDetector(
          onTap: () {
            AppAd().showInterstitialAd();
            context.push(StringManager.mobileDetailsRoute,
                extra: datum.key ?? '');
          },
          child: BackgroundMobileItemContainer(
            child: MobileItem(
              mobileModel: MobileModel(
                imageUrl: datum.deviceImage ?? '',
                title: datum.deviceName ?? '',
                mobileKey: datum.key ?? '',
              ),
            ),
          ),
        );
      },
    );
  }
}
