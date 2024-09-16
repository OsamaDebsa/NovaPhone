import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';
import 'package:nova_phone/features/home/business_logic/saved_unsaved_cubit/saved_unsaved_cubit.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_grid_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobile_item.dart'; // Import MobileItem

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBar(title: StringManager.favorites),
      ),
      body: BlocBuilder<SavedUnsavedCubit, SavedUnsavedState>(
        builder: (context, state) {
          if (state is SavedUnsavedInitial) {
            return const Center(child: CustomLoadingIndicator());
          } else if (state is FavoriteSuccess) {
            final favorites = state.favorites;
            if (favorites.isEmpty) {
              return const Column(
                children: [
                  BannerAdView(),
                  Spacer(),
                  Center(
                    child: FittedBox(
                      child: Text(
                        StringManager.noFavorites,
                        style: Styles.styleRegular30,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              );
            } else {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const BannerAdView(),
                    CustomGridView(
                      itemCount: favorites.length,
                      scrollable: false,
                      gridItem: (context, index) {
                        final mobileModel = favorites[index];
                        return InkWell(
                            onTap: () {
                              AppAd().showInterstitialAd();
                              context.push(StringManager.mobileDetailsRoute,
                                  extra: mobileModel.mobileKey);
                            },
                            child: MobileItem(mobileModel: mobileModel));
                      },
                    ),
                  ],
                ),
              );
            }
          } else {
            return const Center(child: Text('An error occurred.'));
          }
        },
      ),
    );
  }
}
