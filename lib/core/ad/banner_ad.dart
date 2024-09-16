import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:nova_phone/core/utils/ad_manager.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';

class BannerAdView extends StatefulWidget {
  const BannerAdView({super.key});

  @override
  BannerAdViewState createState() => BannerAdViewState();
}

class BannerAdViewState extends State<BannerAdView> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  /// Loads a banner ad.
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdId,
      request: const AdRequest(),
      size: AdSize.leaderboard,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          // Handle the error here
          // print('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoaded
          ? SizedBox(
              width: _bannerAd?.size.width.toDouble(),
              height: _bannerAd?.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            )
          : const Center(child: CustomLoadingIndicator()),
    );
  }

  @override
  void dispose() {
    if (_isLoaded) {
      _bannerAd?.dispose();
    }
    super.dispose();
  }
}
