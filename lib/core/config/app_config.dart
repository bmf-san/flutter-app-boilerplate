import 'package:flutter/foundation.dart';

import 'app_config_dev.dart';
import 'app_config_prod.dart';

/// Centralizes all external service IDs (AdMob, etc.)
/// Remove or extend as needed.
abstract class AppConfig {
  // AdMob iOS
  String get iosAdMobAppId;
  String get iosBannerAdUnitId;
  String get iosInterstitialAdUnitId;
  String get iosRewardedAdUnitId;

  bool get isDevelopment;

  static AppConfig get current {
    return kReleaseMode ? AppConfigProd() : AppConfigDev();
  }
}
