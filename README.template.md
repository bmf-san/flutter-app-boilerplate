# アプリ名（英語表記）

<!-- 短い説明（1〜2行） -->
TODO: アプリの説明

[![Flutter Version](https://img.shields.io/badge/Flutter-3.38.6+-02569B?logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.10.7+-0175C2?logo=dart)](https://dart.dev)
![License](https://img.shields.io/badge/License-Private-red)

**バージョン**: TODO: x.x.x+xx
**対応プラットフォーム**: iOS
**アーキテクチャ**: Clean Architecture
**状態管理**: Riverpod 2.x

## 概要

TODO: アプリの概要・コンセプトを記述。

### 主な特徴

- TODO: 特徴1
- TODO: 特徴2
- TODO: 特徴3

## 機能

### TODO: カテゴリ1
- TODO: 機能

### TODO: カテゴリ2
- TODO: 機能

### UI・デザイン
- Material Design 3 準拠
- 多言語対応（日本語・英語）
- ダークモード対応
- レスポンシブデザイン

## 使い方

### 1. TODO: 主要操作1
- TODO: 説明

### 2. TODO: 主要操作2
- TODO: 説明

## セットアップ手順

### 前提条件
- Flutter SDK 3.38.6以上
- Dart SDK 3.10.7以上
- macOS / Xcode 14以上 / CocoaPods

### 1. リポジトリをクローン
```bash
git clone git@github.com:TODO_GITHUB_USER/TODO_REPO_NAME.git
cd TODO_REPO_NAME
```

### 2. 依存関係のインストール
```bash
flutter pub get
```

### 3. コード生成
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. アプリケーションの起動
```bash
# シミュレーターを起動
open -a Simulator

# アプリを実行
flutter run -d iphone
```

**注意**: iOS実機での実行には、Apple Developer アカウントと証明書・プロビジョニングプロファイルが必要です。

## スクリーンショット

App Store 提出用スクリーンショット（6.9" / iPhone 17 Pro Max）を自動撮影します。

### 推奨: 全自動撮影（flutter drive）

```bash
make ss-ja   # 日本語スクリーンショット一括撮影
make ss-en   # 英語スクリーンショット一括撮影
```

#### 前提
- Makefile 内の `SIM_69` に iPhone 17 Pro Max シミュレーターの UDID を設定済みであること
- ImageMagick インストール済み（`brew install imagemagick`）

#### 撮影される画面

| ファイル名 | 画面 | ポイント |
|---|---|---|
| TODO | TODO | TODO |

> テストデータは `lib/main_screenshot.dart` で Hive に直接シードされます。
> 本番データには一切影響しません（別エントリーポイント使用）。

### 手動撮影（1枚ずつ）

```bash
make ss-ja-01   # 〜 ss-ja-0X
make ss-en-01   # 〜 ss-en-0X
```

### 保存先

```
docs/screenshots/
├── ja/6.9/   # iPhone 17 Pro Max (1320×2868 px)
└── en/6.9/
```

PNG ファイルは `.gitignore` で除外済みです。

## Makefile コマンド

```bash
make help       # コマンド一覧を表示
make setup      # 依存関係インストール + コード生成
make gen        # コード生成のみ (build_runner)
make run        # シミュレーターでアプリを起動
make test       # ユニットテストを実行
make analyze    # 静的解析を実行
make build      # iOS リリースビルド
make ss-ja      # 日本語スクリーンショット一括撮影
make ss-en      # 英語スクリーンショット一括撮影
```

## テスト実行

```bash
# ユニットテスト
flutter test

# カバレッジレポート生成
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 静的解析

```bash
flutter analyze
```

## CI/CD

GitHub Actions による自動テスト・静的解析を実装済み。

### 自動実行される内容
- 静的解析（`flutter analyze`）
- ユニットテスト（`flutter test`）
- コード生成（`build_runner`）

## ビルド

```bash
make build
# または
flutter build ios --release
```

**注意**:
- iOS実機用ビルドには、有効な Apple Developer アカウントと証明書が必要です
- App Store への公開には、Xcode でのアーカイブ・アップロード作業が必要です
- 詳細は [Flutter 公式ドキュメント](https://docs.flutter.dev/deployment/ios) を参照してください

## コーディング規約

- [Effective Dart](https://dart.dev/guides/language/effective-dart) に準拠
- 命名規則: UpperCamelCase（クラス）、lowerCamelCase（関数・変数）
- フォーマット: `flutter format .` で自動整形
- Lint: `flutter_lints` パッケージを使用

## プロジェクト構成

```
TODO_REPO_NAME/
├── Makefile                    # よく使うコマンドのショートカット
├── lib/
│   ├── core/
│   │   ├── ads/                # AdMob 広告設定
│   │   ├── config/             # 環境設定（AdMob ID 等）
│   │   ├── constants/          # 定数定義
│   │   ├── error/              # エラーハンドリング
│   │   └── theme/              # テーマ設定（Material Design 3）
│   ├── data/
│   │   ├── datasources/local/  # Hive データソース
│   │   ├── models/             # Hive / Freezed モデル
│   │   └── repositories/       # リポジトリ実装
│   ├── domain/
│   │   ├── entities/           # Pure Dart エンティティ
│   │   ├── repositories/       # リポジトリインターフェース
│   │   └── usecases/           # ユースケース
│   ├── presentation/
│   │   ├── providers/          # Riverpod 状態管理
│   │   ├── screens/            # UI 画面
│   │   └── widgets/            # 再利用可能なウィジェット
│   ├── l10n/                   # 多言語対応（日本語・英語、ARB 形式）
│   ├── app.dart                # App ウィジェット
│   ├── main.dart               # エントリーポイント
│   └── main_screenshot.dart    # スクリーンショット用エントリーポイント
├── integration_test/
│   └── screenshot_test.dart    # App Store スクリーンショット自動撮影テスト
├── test_driver/
│   └── integration_test.dart   # flutter drive ホスト側ドライバー
├── test/                       # ユニットテスト
├── docs/
│   └── screenshots/            # スクリーンショット（make ss-ja / ss-en で生成）
└── public/                     # 静的コンテンツ（Cloudflare Pages 配信）
    └── privacy-policy/         # プライバシーポリシー
```

## マネタイズ

### 広告統合（iOS対応）

Google AdMob を使用して広告収益化しています。

**実装済みの広告:**
- **バナー広告**: 主要画面の下部に常時表示

**AdMob ID 管理:**

| 設定箇所 | 内容 |
|---|---|
| `ios/Runner/Info.plist` > `GADApplicationIdentifier` | AdMob アプリ ID |
| `lib/core/ads/ad_helper.dart` > `bannerAdUnitId` | バナー広告ユニット ID |

## 実装仕様

### 技術スタック
- **フレームワーク**: Flutter 3.38.6+ / Dart 3.10.7+
- **対応プラットフォーム**: iOS
- **アーキテクチャ**: Clean Architecture（Domain / Data / Presentation 層分離）
- **状態管理**: Riverpod 2.x（コード生成）
- **データモデル**: Freezed（イミュータブル）
- **ローカル DB**: Hive
- **広告**: Google AdMob
- **多言語**: flutter_localizations（ja / en）

## 注意事項

- TODO: アプリ固有の注意事項を記述

## App Store リリース手順

> 初回のみ証明書・プロファイルの準備が必要です。2 回目以降は手順 3 から始めます。

### 初回のみ: 証明書・プロファイルの準備

#### 1. Distribution 証明書の作成

```bash
openssl genrsa -out ~/Desktop/ios_distribution.key 2048
openssl req -new -key ~/Desktop/ios_distribution.key \
  -out ~/Desktop/ios_distribution.csr \
  -subj "/emailAddress=TODO@example.com/CN=TODO NAME/C=JP"
```

1. https://developer.apple.com/account/ → **Certificates → +**
2. **Apple Distribution** を選択 → Continue
3. 上記 CSR をアップロード → 証明書（`.cer`）をダウンロード
4. Keychain にインポート:
```bash
security import ~/Desktop/distribution.cer -k ~/Library/Keychains/login.keychain-db
security import ~/Desktop/ios_distribution.key -k ~/Library/Keychains/login.keychain-db -T /usr/bin/codesign
security find-identity -v -p codesigning
```
5. `ios_distribution.key` を安全な場所に保存 → Desktop からは削除

#### 2. プロビジョニングプロファイルの作成

1. https://developer.apple.com/account/ → **Profiles → +**
2. **App Store Connect** を選択 → Continue
3. App ID: `TODO_BUNDLE_IDENTIFIER` を選択 → Continue
4. Certificate: Distribution 証明書にチェック → Continue
5. Profile Name: `TODO_APP_AppStore` → Generate → Download
6. UUID 名でインストール:
```bash
python3 -c "
import subprocess, re, shutil, os
src = os.path.expanduser('~/Desktop/TODO_APP_AppStore.mobileprovision')
result = subprocess.run(['security', 'cms', '-D', '-i', src], capture_output=True, text=True)
m = re.search(r'<key>UUID</key>\s*<string>(.*?)</string>', result.stdout)
if m:
    uuid = m.group(1)
    dst_dir = os.path.expanduser('~/Library/MobileDevice/Provisioning Profiles')
    os.makedirs(dst_dir, exist_ok=True)
    shutil.copy2(src, os.path.join(dst_dir, uuid + '.mobileprovision'))
    print('Installed:', uuid)
"
```

---

### 毎回のリリース手順

#### 1. バージョンを上げる

`pubspec.yaml` の `version` を更新:

```yaml
# version: メジャー.マイナー.パッチ+ビルド番号
version: x.x.x+xx
```

**バージョニングルール**:

| 種別 | marketing version | build 番号 | 例 |
|---|---|---|---|
| バグ修正・再提出 | patch を +1 | +1 | `1.0.1+3` → `1.0.2+4` |
| 機能追加 | minor を +1, patch を 0 に | +1 | `1.0.2+4` → `1.1.0+5` |
| 大型変更 | major を +1 | +1 | `1.x.x+N` → `2.0.0+N+1` |

リリース後に git tag を切る:

```bash
git tag vx.x.x
git push origin vx.x.x
```

#### 2. スクリーンショット撮影（UI に変更がある場合）

```bash
make ss-ja
make ss-en
```

#### 3. Xcode でアーカイブ

```bash
open ios/Runner.xcworkspace
```

1. TARGETS > Runner → **Signing & Capabilities**
   - Automatically manage signing: OFF
   - Provisioning Profile: `TODO_APP_AppStore` を選択
   - Signing Certificate: `Apple Distribution: TODO NAME` を選択
2. デバイスを **Any iOS Device (arm64)** に変更
3. **Product → Archive**（3〜5 分）

#### 4. App Store Connect にアップロード

Organizer が開いたら:
1. アーカイブを選択 → **Distribute App**
2. **App Store Connect** → **Upload** → Next → Next → Upload

#### 5. App Store Connect で審査提出

https://appstoreconnect.apple.com

1. アプリの新バージョンを作成
2. スクリーンショット・説明文を更新
3. **ビルド** セクションでアップロードしたビルドを選択（Processing 完了後 10〜30 分）
4. **審査へ提出**（審査期間: 通常 1〜3 日）

---

## プライバシーポリシー

プライバシーポリシーは `public/privacy-policy/` に配置しており、Cloudflare Pages で配信します。

- 日本語: [https://TODO.pages.dev/privacy-policy/](https://TODO.pages.dev/privacy-policy/)
- English: [https://TODO.pages.dev/privacy-policy/en](https://TODO.pages.dev/privacy-policy/en)

### Cloudflare Pages セットアップ

詳細は [public/README.md](./public/README.md) を参照してください。概要:

1. [Cloudflare Pages](https://pages.cloudflare.com/) でプロジェクトを作成
2. リポジトリ: `TODO_REPO_NAME` / ブランチ: `main`
3. Build output directory: `public`（Build command は空欄）
4. デプロイ後、App Store Connect > アプリ情報 > プライバシーポリシー URL に登録
