import 'package:flutter/widgets.dart';
import 'package:nova_phone/core/utils/assets.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/features/home/data/models/compare_item_model.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/compare_result_item.dart';

class ComparisonResultListView extends StatelessWidget {
  const ComparisonResultListView(
      {super.key, this.firstDeviceDetails, this.secondDeviceDetails});
  final MobileDetails? firstDeviceDetails;
  final MobileDetails? secondDeviceDetails;
  @override
  Widget build(BuildContext context) {
    List<CompareItemModel> compareItemResult = [
      CompareItemModel(
        first: firstDeviceDetails?.ram ?? '',
        second: secondDeviceDetails?.ram ?? '',
        image: Assets.assetsRam,
        imageTitle: StringManager.ram,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.chipset ?? '',
        second: secondDeviceDetails?.chipset ?? '',
        image: Assets.assetsProcessor,
        imageTitle: StringManager.processor,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.storage ?? '',
        second: secondDeviceDetails?.storage ?? '',
        image: Assets.assetsStorage,
        imageTitle: StringManager.storage,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.osType ?? '',
        second: secondDeviceDetails?.osType ?? '',
        image: Assets.assetsOs,
        imageTitle: StringManager.os,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.camera ?? '',
        second: secondDeviceDetails?.camera ?? '',
        image: Assets.assetsCamera,
        imageTitle: StringManager.camera,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.video ?? '',
        second: secondDeviceDetails?.video ?? '',
        image: Assets.assetsVideo,
        imageTitle: StringManager.video,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.battery ?? '',
        second: secondDeviceDetails?.battery ?? '',
        image: Assets.assetsBattery,
        imageTitle: StringManager.battery,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.displaySize ?? '',
        second: secondDeviceDetails?.displaySize ?? '',
        image: Assets.assetsSize,
        imageTitle: StringManager.display,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.body ?? '',
        second: secondDeviceDetails?.body ?? '',
        image: Assets.assetsBody,
        imageTitle: StringManager.body,
      ),
      CompareItemModel(
        first: firstDeviceDetails?.releaseDate ?? '',
        second: secondDeviceDetails?.releaseDate ?? '',
        image: Assets.assetsdate,
        imageTitle: StringManager.launch,
      ),
    ];

    return ListView.builder(
      itemCount: compareItemResult.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CompareResultItem(
            compareItemModel: compareItemResult[index],
          ),
        );
      },
    );
  }
}
