# flutter-app-boilerplate

iOS-first Flutter app template based on real production apps.  
Opinionated stack: **Riverpod · Hive · Freezed · Clean Architecture · Material 3 (Slate theme) · AdMob · l10n (ja/en)**

---

## Stack

| Layer | Package |
|---|---|
| State Management | flutter_riverpod + riverpod_generator |
| Local Storage | hive + hive_generator |
| Models | json_serializable (data layer), equatable (domain entities) |
| Theme | Material 3, shadcn/ui slate scale, dark/light |
| Localization | flutter_localizations (ja / en) |
| Ads | google_mobile_ads (abstracted, removable) |
| Testing | flutter_test, integration_test, mocktail |
| Screenshots | flutter drive + xcrun simctl + ImageMagick |

---

## Directory structure

```
lib/
  main.dart                  # Production entry point
  main_screenshot.dart       # Entry point for screenshot tests
  app.dart                   # MaterialApp + theme + l10n
  core/
    ads/                     # AdMob initializer
    config/                  # AppConfig (dev/prod)
    constants/               # StorageKeys, AppConstants
    error/                   # Failure classes
    theme/                   # AppTheme (slate), AppColors
  data/
    datasources/local/       # Hive data sources
    models/                  # Hive + json_serializable models
    repositories/            # Repository implementations
  domain/
    entities/                # Pure Dart entities (Equatable)
    repositories/            # Repository interfaces
    usecases/                # Use case classes
  l10n/                      # .arb files (app_en.arb, app_ja.arb)
  presentation/
    providers/               # Riverpod notifiers
    screens/                 # Screen widgets
    widgets/                 # Shared widgets (BannerAdWidget, ...)
integration_test/
  screenshot_test.dart       # flutter drive screenshot test
test_driver/
  integration_test.dart
```

---

## Getting started

### 1. Use this template

Click **"Use this template"** on GitHub to create a new repository.

### 2. Rename the app

- `pubspec.yaml` → `name:`, `description:`
- `lib/app.dart` → `title:`
- `lib/core/constants/app_constants.dart` → `appName`, `privacyPolicyUrl`
- `lib/l10n/app_en.arb` + `app_ja.arb` → `appTitle`
- Xcode → Runner target → Display Name, Bundle Identifier

### 3. Set up AdMob (or remove it)

**To use AdMob:**
- `lib/core/config/app_config_prod.dart` → replace `TODO_REPLACE_WITH_*` with real IDs
- `ios/Runner/Info.plist` → add `GADApplicationIdentifier`

**To remove AdMob:**
- Delete `lib/core/ads/`, `lib/presentation/widgets/banner_ad_widget.dart`
- Remove `google_mobile_ads` from `pubspec.yaml`
- Remove `await initializeAds()` from `main.dart`

### 4. Set your simulator UDID

Edit `Makefile`:
```makefile
SIM_69 := YOUR_SIMULATOR_UDID_HERE
```

Find it with:
```bash
xcrun simctl list devices | grep "iPhone 17 Pro Max"
```

### 5. Install & run

```bash
make setup   # flutter pub get + build_runner + gen-l10n
make run     # launch on simulator
```

---

## Development commands

```bash
make setup    # Install dependencies + code generation
make gen      # build_runner only
make run      # Run on simulator
make test     # Unit tests
make analyze  # Flutter analyze
make build    # iOS release build
make ss-ja    # Capture all screenshots in Japanese
make ss-en    # Capture all screenshots in English
```

---

## Adding a new feature

1. Add entity in `lib/domain/entities/`
2. Add repository interface in `lib/domain/repositories/`
3. Add use cases in `lib/domain/usecases/`
4. Add Hive model in `lib/data/models/` (register adapter in `main.dart`)
5. Add data source in `lib/data/datasources/local/`
6. Add repository impl in `lib/data/repositories/`
7. Add Riverpod provider in `lib/presentation/providers/`
8. Add screen in `lib/presentation/screens/`
9. Run `make gen` to regenerate code

---

## Screenshots

Screenshots are automatically taken via `flutter drive` and saved to `docs/screenshots/<lang>/6.9/`.  
Alpha channel is stripped to 8-bit RGB (required by App Store Connect) using ImageMagick.

Prerequisites:
- [ImageMagick](https://imagemagick.org/) (`brew install imagemagick`)
- iPhone 17 Pro Max (6.9") simulator booted

```bash
make ss-ja   # Japanese screenshots
make ss-en   # English screenshots
```

---

## License

MIT
