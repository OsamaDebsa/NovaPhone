import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/size_config.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/details_item_model_grid_view.dart';

class DetailsItemGridView extends StatelessWidget {
  const DetailsItemGridView({super.key, required this.detailsItemModelel});
  final DetailsItemModel detailsItemModelel;

  @override
  Widget build(BuildContext context) {
    // Calculate responsive text size based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = screenWidth / 375;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: ColorManager.softGrayColor,
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
        color: ColorManager.mainColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                height: SizeConfig.defultSize * 3.2,
                detailsItemModelel.image,
                // color: ColorManager.whiteColor,
              ),
            ),
            Flexible(
              child: Text(
                detailsItemModelel.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Styles.styleMedium14.copyWith(
                  fontSize: Styles.styleMedium14.fontSize! * textScaleFactor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
