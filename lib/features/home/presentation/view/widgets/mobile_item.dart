import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/core/widgets/custom_image_display.dart';
import 'package:nova_phone/features/home/data/models/mobile_model.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/background_mobile_item_container.dart';
import 'favorite_icon_button.dart';

class MobileItem extends StatelessWidget {
  final MobileModel mobileModel;
  final double? imageAspectRatio;

  const MobileItem({
    super.key,
    required this.mobileModel,
    this.imageAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackgroundMobileItemContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Center(
                  child: CustomImageDisplay(
                    imageUrl: mobileModel.imageUrl,
                    aspectRatio: imageAspectRatio ?? .8,
                  ),
                ),
                FavoriteIconButton(mobileModel: mobileModel),
              ],
            ),
            Center(
              child: Text(
                mobileModel.title,
                style: Styles.styleRegular12,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
