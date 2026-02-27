import 'app_config.dart';

/// TODO: Replace with your real AdMob production IDs.
/// Keep this file out of version control if needed (add to .gitignore).
class AppConfigProd implements AppConfig {
  @override
  bool get isDevelopment => false;

  @override
  String get iosAdMobAppId => 'TODO_REPLACE_WITH_ADMOB_APP_ID';
  @override
  String get iosBannerAdUnitId => 'TODO_REPLACE_WITH_BANNER_AD_UNIT_ID';
  @override
  String get iosInterstitialAdUnitId =>
      'TODO_REPLACE_WITH_INTERSTITIAL_AD_UNIT_ID';
  @override
  String get iosRewardedAdUnitId => 'TODO_REPLACE_WITH_REWARDED_AD_UNIT_ID';
}
