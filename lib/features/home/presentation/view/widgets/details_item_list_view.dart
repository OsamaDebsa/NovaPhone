import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/details_item_model_llst_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_item_result_container.dart';

class DetailsItemListView extends StatelessWidget {
  const DetailsItemListView({super.key, required this.detilsItemModelLlstView});
  final DetailsItemModelLlstView detilsItemModelLlstView;

  @override
  Widget build(BuildContext context) {
    return CustomItemResultContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    detilsItemModelLlstView.image,
                    height: 33,
                    colorFilter: const ColorFilter.mode(
                        ColorManager.lightSilverColor, BlendMode.srcIn),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    textAlign: TextAlign.center,
                    detilsItemModelLlstView.title,
                    style: Styles.styleBold16,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    detilsItemModelLlstView.description1,
                    style: Styles.styleRegular18,
                    maxLines: 2,
                  ),
                  if (detilsItemModelLlstView.description2 != null &&
                      detilsItemModelLlstView.description2!.isNotEmpty) ...[
                    const SizedBox(height: 4.0),
                    Text(
                      detilsItemModelLlstView.description2!,
                      style: Styles.styleRegular18,
                      maxLines: 1,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
