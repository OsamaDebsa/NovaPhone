import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nova_phone/core/utils/ad_manager.dart';

part 'rewarded_video_ad_state.dart';

class RewardedVideoAdCubit extends Cubit<RewardedVideoAdState> {
  RewardedAd? _rewardedAd;
  RewardedVideoAdCubit() : super(RewardedVideoAdInitial());
  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdManager.rewardedVideoAd,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          emit(RewardedVideoAdStateLoaded());
        },
        onAdFailedToLoad: (LoadAdError error) {
          emit(RewardedVideoAdStateFailedToLoad());
        },
      ),
    );
  }

  void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          emit(RewardedVideoAdStateWatched());
        },
      );

      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          ad.dispose();
          _rewardedAd = null;
          emit(RewardedVideoAdStateDismissed());
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          ad.dispose();
          _rewardedAd = null;
          emit(RewardedVideoAdStateFailedToShow());
        },
      );
    } else {
      // Handle case where ad is not available (should rarely occur if loaded properly)
      emit(RewardedVideoAdStateFailedToShow());
    }
  }
}
