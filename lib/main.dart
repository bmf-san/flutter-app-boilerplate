import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/ads/ad_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  // TODO: Register Hive adapters
  // Hive.registerAdapter(ExampleModelAdapter());
  // await Hive.openBox<ExampleModel>('examples');

  // Initialize Google Mobile Ads (remove if not using AdMob)
  await initializeAds();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
