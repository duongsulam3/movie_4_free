FVM_CHECK := $(shell command -v fvm 2> /dev/null)

# If FVM is installed, use it; otherwise, fallback to system Flutter
ifeq ($(strip $(FVM_CHECK)),)
	FLUTTER = flutter
else
	FLUTTER = fvm flutter
endif

# Targets
.PHONY: all clean build test run usecase help colors colors_delete build_ipa init

# Default command
# Default command
help:
	@echo "📱 Available Commands"
	@echo "🧹 Clean & Setup:"
	@echo "  make clean                   - Flutter clean"
	@echo "  make clean_ios               - Clean iOS build"
	@echo "  make get                     - Get dependencies"
	@echo "  make init                    - Generate l10n from app_*.arb + pub get"
	@echo "  make build_ipa               - Build iOS IPA"
	@echo "  make encrypt_env             - Encrypt .ENV"
	@echo "  make decrypt_env             - Decrypt .ENV"
	@echo ""
	@echo "📚 Full guide: See DEPLOYMENT_GUIDE.md"

colors:
	@$(MAKE) build
	@bash scripts/update_app_color.sh
	@echo "✅ Color '$(NAME)' with hex '$(HEX)' added successfully!"
	
clean:
	@$(FLUTTER) clean

get:
	@$(FLUTTER) pub get

init:
	@./scripts/gen_l10n.sh
	@$(FLUTTER) pub get

build:
	@echo "Building..."
	@$(FLUTTER) pub run build_runner build --delete-conflicting-outputs
	@echo "Build completed."

watch:
	@echo "Watching for changes..."
	@$(FLUTTER) pub run build_runner watch --delete-conflicting-outputs

test:
	@$(FLUTTER) test

run:
	@$(FLUTTER) run

remove_clean:
	@$(FLUTTER) clean
	@rm -rf ios/Podfile.lock
	@rm -rf ios/Pods
	@$(FLUTTER) pub get
	@cd ios && pod install --repo-update

# Fix warnings automatically
fix-warnings:
	@echo "🔧 Fixing warnings..."
	@bash scripts/fix_warnings.sh
	@echo "✅ Warnings fixed!"


# ============================================================
# Clean Android Builds (when you have issues)
# ============================================================

clean_android:
	@echo "🧹 Deep cleaning Android build..."
	@rm -rf android/.gradle android/build android/app/build 2>/dev/null || true
	@rm -rf build/app 2>/dev/null || true
	@$(FLUTTER) clean
	@$(FLUTTER) pub get
	@echo "✅ Android clean completed!"

# Clean with Gradle (requires Java)
clean_android_gradle:
	@echo "🧹 Deep cleaning Android with Gradle..."
	@cd android && ./gradlew clean || echo "⚠️  Gradle clean failed, continuing..."
	@$(MAKE) clean_android

check_ci:
	@./scripts/prepare_envs.sh
	@$(FLUTTER) analyze --fatal-infos --fatal-warnings
	./scripts/check_functions.sh --changed-from=develop

usecase: 
	@echo "🚀 Generating usecase with Mason..."
	@cd mason_lib && mason make usecases --on-conflict append -o ../
	@echo "✅ Usecase generation completed with auto TODO processing!"

feature:
	@echo "🚀 Generating feature with Mason..."
	@cd mason_lib && mason make feature --on-conflict append -o ../
	@echo "✅ Feature generation completed with auto TODO processing!"

open_organizer:
	@echo "📂 Opening Xcode Organizer..."
	@open -a Xcode.app ~/Library/Developer/Xcode/Archives

clean_ios:
	@echo "🧹 Cleaning iOS build artifacts..."
	@rm -rf ios/Pods
	@rm -rf ios/Podfile.lock
	@rm -rf ios/build
	@rm -rf ios/.symlinks
	@rm -rf build/ios
	@echo "✅ iOS clean completed!"

# ============================================================
# Build APK
# ============================================================

build_apk:
	@echo "📦 Building APK..."
	@$(FLUTTER) build apk --release -t lib/main.dart
	@echo "✅ APK build completed!"

# ============================================================
# Build IPA
# ============================================================

build_ipa:
	@echo "📦 Building IPA..."
	@bash scripts/build_ipa.sh
	@echo "✅ IPA build completed!"

# ============================================================
# Encrypt/Decrypt ENV
# ============================================================

encrypt_env:
	@bash scripts/prepare.sh encrypt

decrypt_env:
	@bash scripts/prepare.sh decrypt
	