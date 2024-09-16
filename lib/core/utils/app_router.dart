import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/ad/rewarded_video_ad.dart';
import 'package:nova_phone/core/utils/service_locator.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/widgets/custom_web_view.dart';
import 'package:nova_phone/features/home/business_logic/all_devices_cubit/all_devices_cubit.dart';
import 'package:nova_phone/features/home/business_logic/mobile_by_brand_cubit/mobile_by_brand_cubit.dart';
import 'package:nova_phone/features/home/business_logic/mobile_details_cubit/mobile_details_cubit.dart';
import 'package:nova_phone/features/home/business_logic/rewarded_video_ad_cubit/rewarded_video_ad_cubit.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';
import 'package:nova_phone/features/home/data/repos/home_repo_impl.dart';
import 'package:nova_phone/features/home/presentation/view/favorites_view.dart';
import 'package:nova_phone/features/home/presentation/view/home_view.dart';
import 'package:nova_phone/features/home/presentation/view/mobile_details_view.dart';
import 'package:nova_phone/features/home/presentation/view/mobiles_by_brand_view.dart';
import 'package:nova_phone/features/home/presentation/view/search_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/compare_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/recommende_see_more_view.dart';
import 'package:nova_phone/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: StringManager.splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: StringManager.homeRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: StringManager.mobileDetailsRoute,
        builder: (context, state) {
          final mobileKey = state.extra as String?;
          return BlocProvider(
            create: (context) => MobileDetailsCubit(getIt.get<HomeRepoImpl>())
              ..getMobileDetails(mobileKey: mobileKey ?? ''),
            child: const MobileDetailsView(),
          );
        },
      ),
      GoRoute(
        path: StringManager.recommende1SeeMoreRoute,
        builder: (context, state) {
          final recommended = state.extra as dynamic;
          return RecommendeSeeMoreView(
              recommendedList: recommended.data, title: recommended.title);
        },
      ),
      GoRoute(
        path: StringManager.webViewRoute,
        builder: (context, state) {
          final url = state.extra as String?;
          return WebViewScreen(url: url ?? '');
        },
      ),
      GoRoute(
        path: StringManager.mobilesByBrandRoute,
        builder: (context, state) {
          final brandModel = state.extra as BrandModel?;
          return BlocProvider(
            create: (context) => MobileByBrandCubit(getIt.get<HomeRepoImpl>())
              ..fetchDeviceListByBrand(
                  brandName: brandModel.brandName ?? '',
                  page: 1,
                  brandId: brandModel.brandId ?? 0),
            child: MobilesByBrandView(
              brandModel: brandModel!,
            ),
          );
        },
      ),
      GoRoute(
        path: StringManager.searchViewRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                AllDevicesCubit(getIt.get<HomeRepoImpl>())..getAllDevices(),
            child: SearchView(
              onItemSelected: state.extra as void Function(String)?,
            ),
          );
        },
      ),
      GoRoute(
        path: StringManager.favoritesViewRoute,
        builder: (context, state) => const FavoritesView(),
      ),
      GoRoute(
        path: StringManager.compareViewRoute,
        builder: (context, state) {
          final String? mobileKey = state.extra as String?;
          return BlocProvider(
            create: (context) => MobileDetailsCubit(getIt.get<HomeRepoImpl>()),
            child: CompareView(mobileKey: mobileKey),
          );
        },
      ),
      GoRoute(
        path: StringManager.rewardedVideoAdRoute,
        builder: (context, state) {
          final String viewRoute = state.extra as String;
          return BlocProvider(
            create: (context) => RewardedVideoAdCubit()..loadRewardedAd(),
            child: RewardedVideoAd(viewRoute: viewRoute),
          );
        },
      ),
    ],
  );
}
