/// Entry point for screenshot/integration tests.
/// Used by Makefile `ss-ja` / `ss-en` targets via:
///   --target=integration_test/screenshot_test.dart
///   --dart-define=SCREENSHOT_BUILD=true
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // TODO: Register Hive adapters (same as main.dart)

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
