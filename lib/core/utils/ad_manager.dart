class AdManager {
  static bool isTest = false;
  static String bannerAdId = isTest
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-3769780882856254/2500898300";
  static String interstitialAdId = isTest
      ? "ca-app-pub-3940256099942544/1033173712"
      : "ca-app-pub-3769780882856254/2870663464";
  static String appOpenAdId = isTest
      ? "ca-app-pub-3940256099942544/9257395921"
      : "ca-app-pub-3769780882856254/5992015784";
  static String rewardedVideoAd = isTest
      ? "ca-app-pub-3940256099942544/5224354917"
      : "ca-app-pub-3769780882856254/8240208516";
}
