import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nova_phone/core/utils/ad_manager.dart';

class AppAd {
  InterstitialAd? _interstitialAd;
  AppOpenAd? _appOpenAd;

  void showInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdManager.interstitialAdId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          if (_interstitialAd != null) {
            _interstitialAd!.show();
          }

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent:
                (InterstitialAd ad, AdError error) {
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          // print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showAppOpenAd() {
    AppOpenAd.load(
      adUnitId: AdManager.appOpenAdId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (AppOpenAd ad) {
          _appOpenAd = ad;
          if (_appOpenAd != null) {
            ad.show();
          }
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (AppOpenAd ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (AppOpenAd ad, AdError error) {
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (error) {
          // print('AppOpenAd failed to load: $error');
        },
      ),
    );
  }
}
