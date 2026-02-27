import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Screenshot integration test.
/// Run via: make ss-ja  OR  make ss-en
///
/// SCREENSHOT_LANG is passed via --dart-define=SCREENSHOT_LANG=ja|en
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  const lang =
      String.fromEnvironment('SCREENSHOT_LANG', defaultValue: 'ja');
  const screenshotDir = 'docs/screenshots/$lang/6.9';

  Future<void> takeScreenshot(WidgetTester tester, String name) async {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
    await binding.takeScreenshot(name);

    // Save to docs/screenshots/<lang>/6.9/
    final screenshotBytes = binding.takeScreenshot(name);
    // Note: actual file saving is handled by xcrun simctl io screenshot
    // (see Makefile). This is a placeholder for custom save logic if needed.
  }

  group('Screenshots', () {
    testWidgets('01 – Home screen', (tester) async {
      // TODO: pump your app and navigate to the desired state
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await takeScreenshot(tester, '$screenshotDir/screenshot_01.png');
    });
  });
}
