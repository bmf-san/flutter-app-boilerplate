import 'app_config.dart';

class AppConfigDev implements AppConfig {
  @override
  bool get isDevelopment => true;

  // AdMob test IDs – safe to commit
  @override
  String get iosAdMobAppId => 'ca-app-pub-3940256099942544~1458002511';
  @override
  String get iosBannerAdUnitId => 'ca-app-pub-3940256099942544/2934735716';
  @override
  String get iosInterstitialAdUnitId => 'ca-app-pub-3940256099942544/4411468910';
  @override
  String get iosRewardedAdUnitId => 'ca-app-pub-3940256099942544/1712485313';
}
