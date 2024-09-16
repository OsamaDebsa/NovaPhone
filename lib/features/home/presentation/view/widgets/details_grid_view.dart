import 'package:flutter/material.dart';
import 'package:nova_phone/features/home/data/mobile_details_data.dart';
import 'package:nova_phone/features/home/data/models/details_item_model_grid_view.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_grid_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/details_item_grid_view.dart';

class DetailsGridView extends StatelessWidget {
  const DetailsGridView({super.key, required this.mobileDetails});
  final MobileDetails mobileDetails;

  @override
  Widget build(BuildContext context) {
    List<DetailsItemGridView> detailsItem = getDetailsItem(mobileDetails);
    return SizedBox(
      height: 250,
      child: CustomGridView(
        childAspectRatio: 1,
        gridItem: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: DetailsItemGridView(
              detailsItemModelel: DetailsItemModel(
                title: detailsItem[index].detailsItemModelel.title,
                image: detailsItem[index].detailsItemModelel.image,
              ),
            ),
          );
        },
        crossAxisCount: 3,
        itemCount: detailsItem.length,
      ),
    );
  }
}
