import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/assets.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/features/home/data/models/details_item_model_llst_view.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/details_item_list_view.dart';

class DetailsListView extends StatelessWidget {
  const DetailsListView({super.key, required this.mobileDetails});
  final MobileDetails mobileDetails;

  @override
  Widget build(BuildContext context) {
    List<DetailsItemModelLlstView> detailsItemModelLlstView = [
      DetailsItemModelLlstView(
        image: Assets.assetsdate,
        title: StringManager.launch,
        description1: mobileDetails.releaseDate ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsSize,
        title: StringManager.display,
        description1: mobileDetails.displaySize ?? '',
        description2: mobileDetails.displayRes ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsRam,
        title: StringManager.ram,
        description1: mobileDetails.ram ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsProcessor,
        title: StringManager.processor,
        description1: mobileDetails.chipset ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsCamera,
        title: StringManager.camera,
        description1: mobileDetails.camera ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsVideo,
        title: StringManager.video,
        description1: mobileDetails.video ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsBattery,
        title: StringManager.battery,
        description1: mobileDetails.battery ?? '',
        description2: mobileDetails.batteryType ?? '',
      ),

      DetailsItemModelLlstView(
        image: Assets.assetsStorage,
        title: StringManager.storage,
        description1: mobileDetails.storage ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsBody,
        title: StringManager.body,
        description1: mobileDetails.body ?? '',
      ),
      DetailsItemModelLlstView(
        image: Assets.assetsOs,
        title: StringManager.os,
        description1: mobileDetails.osType ?? '',
      ),

      //	final List<MoreSpecification>? moreSpecification;
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: detailsItemModelLlstView.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: DetailsItemListView(
            detilsItemModelLlstView: detailsItemModelLlstView[index],
          ),
        );
      },
    );
  }
}
