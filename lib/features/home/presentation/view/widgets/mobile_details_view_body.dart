import 'package:flutter/material.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/details_grid_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/details_list_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/favorite_compare_row.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobile_image_page_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/more_information_section.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/more_specification.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/perice_list_view.dart';

class MobileDetailsViewBody extends StatelessWidget {
  const MobileDetailsViewBody({super.key, required this.mobileDetails});
  final MobileDetails mobileDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            CustomAppBar(title: mobileDetails.deviceName ?? 'Mobile Details'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerAdView(),
            MobileImagePageView(mobileDetails: mobileDetails),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  DetailsGridView(mobileDetails: mobileDetails),
                  DetailsListView(mobileDetails: mobileDetails),
                  MoreDetails(
                    moreSpecificationList: mobileDetails.moreSpecification,
                  ),
                  FavoriteCompareRow(mobileDetails: mobileDetails),
                  (mobileDetails.prices != null)
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: PericeListView(prices: mobileDetails.prices!),
                        )
                      : Container(),
                ],
              ),
            ),
            MoreInformationSection(
              mobileDetails: mobileDetails,
            )
          ],
        ),
      ),
    );
  }
}
