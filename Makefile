.PHONY: help setup gen run test analyze build ss-ja ss-en _sim-lang

# ── REPLACE: your iPhone 17 Pro Max (6.9") simulator UDID ─────────────────────
SIM_69 := XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

# ─────────────────────────────────────────────
# Help
# ─────────────────────────────────────────────
help:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Setup"
	@echo "  setup       Install dependencies + code generation"
	@echo "  gen         Code generation only (build_runner)"
	@echo ""
	@echo "Development"
	@echo "  run         Launch app on simulator"
	@echo "  test        Run unit tests"
	@echo "  analyze     Run static analysis"
	@echo "  build       iOS release build"
	@echo ""
	@echo "Screenshots"
	@echo "  ss-ja       Capture all screenshots in Japanese (6.9\")"
	@echo "  ss-en       Capture all screenshots in English (6.9\")"
	@echo ""

# ─────────────────────────────────────────────
# Setup & Development
# ─────────────────────────────────────────────
setup:
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs
	flutter gen-l10n

gen:
	dart run build_runner build --delete-conflicting-outputs

run:
	flutter run -d iphone

test:
	flutter test

analyze:
	flutter analyze

build:
	flutter build ios --release

# ─────────────────────────────────────────────
# Simulator language switcher
# ─────────────────────────────────────────────
_sim-lang:
	@echo "→ Setting simulator language: $(LANG) / $(LOCALE)"
	@xcrun simctl boot $(SIM_69) 2>/dev/null || true
	@xcrun simctl spawn $(SIM_69) defaults write NSGlobalDomain AppleLanguages -array $(LANG)
	@xcrun simctl spawn $(SIM_69) defaults write NSGlobalDomain AppleLocale $(LOCALE)
	@echo "→ Rebooting simulator to apply language..."
	@xcrun simctl shutdown $(SIM_69)
	@xcrun simctl boot $(SIM_69)
	@echo "→ Waiting for simulator to become ready..."
	@xcrun simctl bootstatus $(SIM_69) -b
	@echo "→ Simulator ready: $(LANG)"

# ─────────────────────────────────────────────
# Automated screenshot capture via flutter drive
# ─────────────────────────────────────────────
ss-ja:
	@$(MAKE) _sim-lang LANG=ja LOCALE=ja_JP
	SCREENSHOT_LANG=ja flutter drive \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/screenshot_test.dart \
		--dart-define=SCREENSHOT_LANG=ja \
		--dart-define=SCREENSHOT_BUILD=true \
		-d $(SIM_69)
	@echo "Converting screenshots to RGB 8-bit (removing alpha)..."
	find docs/screenshots/ja -name "*.png" -exec magick {} -background white -alpha remove -alpha off -depth 8 {} \;
	@echo "Resetting Flutter build target to lib/main.dart..."
	flutter build ios --release

ss-en:
	@$(MAKE) _sim-lang LANG=en LOCALE=en_US
	SCREENSHOT_LANG=en flutter drive \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/screenshot_test.dart \
		--dart-define=SCREENSHOT_LANG=en \
		--dart-define=SCREENSHOT_BUILD=true \
		-d $(SIM_69)
	@echo "Converting screenshots to RGB 8-bit (removing alpha)..."
	find docs/screenshots/en -name "*.png" -exec magick {} -background white -alpha remove -alpha off -depth 8 {} \;
	@echo "Resetting Flutter build target to lib/main.dart..."
	flutter build ios --release
