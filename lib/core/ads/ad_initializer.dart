import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../config/app_config.dart';

/// Returns the platform-appropriate banner ad unit ID.
String get bannerAdUnitId => AppConfig.current.iosBannerAdUnitId;

/// Initializes the Google Mobile Ads SDK.
/// Call once in main() before runApp().
Future<void> initializeAds() async {
  await MobileAds.instance.initialize();
}
