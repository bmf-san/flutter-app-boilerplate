# flutter-app-boilerplate

実際のプロダクションアプリをベースにした iOS 向け Flutter アプリテンプレートです。
採用スタック: **Riverpod · Hive · Freezed · クリーンアーキテクチャ · Material 3 (Slate テーマ) · AdMob · l10n (ja/en)**

---

## スタック

| レイヤー | パッケージ |
|---|---|
| 状態管理 | flutter_riverpod + riverpod_generator |
| ローカルDB | hive + hive_generator |
| モデル | json_serializable (data層), equatable (domain entity) |
| テーマ | Material 3, shadcn/ui slate スケール, ライト/ダーク |
| 多言語対応 | flutter_localizations (ja / en) |
| 広告 | google_mobile_ads (抽象化済み・削除可能) |
| テスト | flutter_test, integration_test, mocktail |
| スクリーンショット | flutter drive + xcrun simctl + ImageMagick |

---

## ディレクトリ構成

```
lib/
  main.dart                  # 本番エントリーポイント
  main_screenshot.dart       # スクリーンショットテスト用エントリーポイント
  app.dart                   # MaterialApp + テーマ + l10n
  core/
    ads/                     # AdMob 初期化
    config/                  # AppConfig (dev/prod)
    constants/               # StorageKeys, AppConstants
    error/                   # Failure クラス
    theme/                   # AppTheme (slate), AppColors
  data/
    datasources/local/       # Hive データソース
    models/                  # Hive + json_serializable モデル
    repositories/            # リポジトリ実装
  domain/
    entities/                # Pure Dart エンティティ (Equatable)
    repositories/            # リポジトリインターフェース
    usecases/                # ユースケース
  l10n/                      # .arb ファイル (app_en.arb, app_ja.arb)
  presentation/
    providers/               # Riverpod ノティファイア
    screens/                 # 画面ウィジェット
    widgets/                 # 共通ウィジェット (BannerAdWidget など)
integration_test/
  screenshot_test.dart       # flutter drive スクリーンショットテスト
test_driver/
  integration_test.dart
```

---

## はじめかた

### 1. テンプレートを使う

GitHub の **"Use this template"** ボタンから新しいリポジトリを作成します。

### 2. アプリ名を変更する

- `pubspec.yaml` → `name:`, `description:`
- `lib/app.dart` → `title:`
- `lib/core/constants/app_constants.dart` → `appName`, `privacyPolicyUrl`
- `lib/l10n/app_en.arb` + `app_ja.arb` → `appTitle`
- Xcode → Runner ターゲット → Display Name, Bundle Identifier

### 3. AdMob の設定（または削除）

**AdMob を使う場合:**
- `lib/core/config/app_config_prod.dart` → `TODO_REPLACE_WITH_*` を実際の ID に置換
- `ios/Runner/Info.plist` → `GADApplicationIdentifier` を追加

**AdMob を使わない場合:**
- `lib/core/ads/`, `lib/presentation/widgets/banner_ad_widget.dart` を削除
- `pubspec.yaml` から `google_mobile_ads` を削除
- `main.dart` から `await initializeAds()` を削除

### 4. シミュレーターの UDID を設定する

`Makefile` を編集:
```makefile
SIM_69 := YOUR_SIMULATOR_UDID_HERE
```

UDID の確認方法:
```bash
xcrun simctl list devices | grep "iPhone 17 Pro Max"
```

### 5. インストール & 起動

```bash
make setup   # flutter pub get + build_runner + gen-l10n
make run     # シミュレーターで起動
```

---

## 開発コマンド

```bash
make setup    # 依存関係のインストール + コード生成
make gen      # build_runner のみ
make run      # シミュレーターで起動
make test     # ユニットテスト
make analyze  # 静的解析
make build    # iOS リリースビルド
make ss-ja    # 日本語スクリーンショット一括撮影
make ss-en    # 英語スクリーンショット一括撮影
```

---

## 新しい機能の追加手順

1. `lib/domain/entities/` にエンティティを追加
2. `lib/domain/repositories/` にリポジトリインターフェースを追加
3. `lib/domain/usecases/` にユースケースを追加
4. `lib/data/models/` に Hive モデルを追加（`main.dart` でアダプターを登録）
5. `lib/data/datasources/local/` にデータソースを追加
6. `lib/data/repositories/` にリポジトリ実装を追加
7. `lib/presentation/providers/` に Riverpod プロバイダーを追加
8. `lib/presentation/screens/` に画面を追加
9. `make gen` でコードを再生成

---

## スクリーンショット

`flutter drive` で自動撮影し `docs/screenshots/<lang>/6.9/` に保存されます。
App Store Connect の要件に合わせて ImageMagick でアルファチャンネルを 8-bit RGB に変換します。

事前準備:
- [ImageMagick](https://imagemagick.org/) (`brew install imagemagick`)
- iPhone 17 Pro Max (6.9") シミュレーターが起動していること

```bash
make ss-ja   # 日本語スクリーンショット
make ss-en   # 英語スクリーンショット
```

---

## ライセンス

MIT
