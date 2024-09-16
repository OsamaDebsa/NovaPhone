import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/features/home/business_logic/mobile_by_brand_cubit/mobile_by_brand_cubit.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobile_by_brand_grid.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/page_indicator_list_view.dart';

class MobilesByBrandViewBody extends StatefulWidget {
  const MobilesByBrandViewBody({
    super.key,
    required this.state,
    required this.brandModel,
  });

  final MobileByBrandSuccess state;
  final BrandModel brandModel;

  @override
  State<MobilesByBrandViewBody> createState() => _MobilesByBrandViewBodyState();
}

int clickedIndex = 1;

class _MobilesByBrandViewBodyState extends State<MobilesByBrandViewBody> {
  @override
  Widget build(BuildContext context) {
    final deviceList = widget.state.deviceByBrandModel.deviceList;
    final totalPage = widget.state.deviceByBrandModel.totalPage;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        setState(() {
          clickedIndex = 1; // Reset clickedIndex to 1 when popping the page
        });
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: BannerAdView()),
          MobileByBrandGrid(
            deviceList: deviceList,
            onTap: _onMobileItemTap,
          ),
          SliverToBoxAdapter(
            child: PageIndicatorListView(
              totalPage: totalPage ?? 1,
              clickedIndex: clickedIndex,
              onPageTap: (page) {
                _fetchDeviceListByPage(page);
                setState(() {
                  clickedIndex = page;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onMobileItemTap(BuildContext context, int index) {
    final mobileKey =
        widget.state.deviceByBrandModel.deviceList?[index].key ?? '';
    AppAd().showInterstitialAd();
    context.push(
      StringManager.mobileDetailsRoute,
      extra: mobileKey,
    );
  }

  void _fetchDeviceListByPage(int page) {
    final brandName = widget.brandModel.brandName ?? '';
    final brandId = widget.brandModel.brandId ?? 0;
    AppAd().showInterstitialAd();
    BlocProvider.of<MobileByBrandCubit>(context).fetchDeviceListByBrand(
      brandName: brandName,
      page: page,
      brandId: brandId,
    );
  }
}
