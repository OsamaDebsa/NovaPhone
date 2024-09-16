import 'package:nova_phone/core/utils/assets.dart';
import 'package:nova_phone/features/home/data/models/details_item_model_grid_view.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/details_item_grid_view.dart';

List<DetailsItemGridView> getDetailsItem(MobileDetails mobileDetails) {
  return [
    DetailsItemGridView(
      detailsItemModelel: DetailsItemModel(
        title: mobileDetails.storage
                ?.replaceAll("no card slot", '')
                .trim()
                .replaceAll('storage,', '')
                .trim()
                .replaceAll(
                  "/",
                  ' - ',
                )
                .trim() ??
            '',
        image: Assets.assetsStorage,
      ),
    ),
    DetailsItemGridView(
      detailsItemModelel: DetailsItemModel(
        title: "${mobileDetails.displaySize} inches",
        image: Assets.assetsSize,
      ),
    ),
    DetailsItemGridView(
      detailsItemModelel: DetailsItemModel(
        title: mobileDetails.chipset ?? '',
        image: Assets.assetsProcessor,
      ),
    ),
    DetailsItemGridView(
      detailsItemModelel: DetailsItemModel(
        title: mobileDetails.battery?.replaceAll("mAh", ' mAh').trim() ?? '',
        image: Assets.assetsBattery,
      ),
    ),
    DetailsItemGridView(
      detailsItemModelel: DetailsItemModel(
        title: mobileDetails.camera?.replaceAll("MP", ' MP').trim() ?? '',
        image: Assets.assetsCamera,
      ),
    ),
    DetailsItemGridView(
      detailsItemModelel: DetailsItemModel(
        title: mobileDetails.ram
                ?.replaceAll("RAM", '')
                .trim()
                .replaceAll("GB", " GB") ??
            '',
        image: Assets.assetsRam,
      ),
    ),
  ];
}
