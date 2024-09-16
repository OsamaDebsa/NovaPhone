import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/brand_itrm.dart';

class BrandListView extends StatelessWidget {
  const BrandListView({super.key, required this.brandList});
  final List<BrandModel> brandList;

  List<BrandModel> _sortBrands(List<BrandModel> brands) {
    brands.sort((a, b) {
      int indexA = StringManager.famousBrands
          .indexOf(a.brandName!); // Assuming brandName is the correct property
      int indexB = StringManager.famousBrands.indexOf(b.brandName!);

      if (indexA == -1) indexA = StringManager.famousBrands.length;
      if (indexB == -1) indexB = StringManager.famousBrands.length;

      return indexA.compareTo(indexB);
    });
    return brands;
  }

  @override
  Widget build(BuildContext context) {
    final sortedBrandList = _sortBrands(List.from(brandList));

    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(left: 28, top: 10, bottom: 10, right: 8)
                : const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: BrandItem(
              brandModel: sortedBrandList[index],
              onTap: () {
                AppAd().showInterstitialAd();
                context.push(
                  StringManager.mobilesByBrandRoute,
                  extra: sortedBrandList[index],
                );
              },
            ),
          );
        },
        itemCount: sortedBrandList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
