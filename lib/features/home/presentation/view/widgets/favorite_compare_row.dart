import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/data/models/mobile_model.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/favorite_compare_container.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/favorite_icon_button.dart';

class FavoriteCompareRow extends StatelessWidget {
  const FavoriteCompareRow({super.key, required this.mobileDetails});
  final MobileDetails mobileDetails;

  void _navigateToCompare(BuildContext context, String mobileKey) {
    context.push(
      StringManager.compareViewRoute,
      extra: mobileKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FavoriteCompareContainer(
            title: StringManager.addToCompare,
            onTab: () => _navigateToCompare(context, mobileDetails.key ?? ''),
            child: IconButton(
              onPressed: () =>
                  _navigateToCompare(context, mobileDetails.key ?? ''),
              icon: const Icon(
                Icons.repeat_rounded,
                color: ColorManager.grayishPurpleColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: FavoriteCompareContainer(
            title: StringManager.addToFavoureite,
            onTab: () {},
            child: FavoriteIconButton(
              mobileModel: MobileModel(
                imageUrl: mobileDetails.deviceImage ?? "",
                mobileKey: mobileDetails.key ?? '',
                title: mobileDetails.deviceName ?? '',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
