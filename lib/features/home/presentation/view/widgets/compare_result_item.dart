import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/compare_item_model.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_item_result_container.dart';

class CompareResultItem extends StatelessWidget {
  const CompareResultItem({super.key, required this.compareItemModel});
  final CompareItemModel compareItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomItemResultContainer(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Expanded(
                child: Center(
                    child: Text(
              compareItemModel.first,
              style: Styles.styleBold14,
              textAlign: TextAlign.center,
            ))),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    compareItemModel.image,
                    height: 33,
                    colorFilter: const ColorFilter.mode(
                        ColorManager.secondaryColor, BlendMode.srcIn),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    textAlign: TextAlign.center,
                    compareItemModel.imageTitle,
                    style: Styles.styleRegular16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  compareItemModel.second,
                  style: Styles.styleBold14,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
