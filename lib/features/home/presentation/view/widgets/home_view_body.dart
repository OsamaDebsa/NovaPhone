import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/service_locator.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';
import 'package:nova_phone/features/home/business_logic/brand_cubit/brand_cubit.dart';
import 'package:nova_phone/features/home/business_logic/recommended_cubit/recommended_cubit.dart';
import 'package:nova_phone/features/home/data/repos/home_repo_impl.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/privacy_policy_button.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/recommended_section.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/select_brand_sction.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const HomeAppBar(),
      ),
      backgroundColor: ColorManager.lightestGrayColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                BrandCubit(getIt.get<HomeRepoImpl>())..fetchPhoneBrands(),
          ),
          BlocProvider(
            create: (context) =>
                RecommendedCubit(getIt.get<HomeRepoImpl>())..getRecommended(),
          ),
        ],
        child: BlocBuilder<BrandCubit, BrandState>(
          builder: (context, brandState) {
            return BlocBuilder<RecommendedCubit, RecommendedState>(
              builder: (context, recommendedState) {
                if (brandState is BrandLoading ||
                    recommendedState is RecommendedLoading) {
                  return const Center(
                    child: CustomLoadingIndicator(),
                  );
                }

                return RefreshIndicator(
                  color: ColorManager.secondaryColor,
                  strokeWidth: 2.5,
                  onRefresh: () async {
                    context.read<BrandCubit>().fetchPhoneBrands();
                    context.read<RecommendedCubit>().getRecommended();
                  },
                  child: const SingleChildScrollView(
                    // physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        BannerAdView(),
                        SizedBox(height: 10),
                        SelectBrandSection(),
                        RecommendedSection(),
                        PrivacyPolicyButton(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
