#!/bin/bash

# Script to automatically fix common Dart/Flutter warnings and improve performance

echo "🔧 Starting automated warning fixes and performance improvements..."

# Navigate to project directory
cd "$(dirname "$0")/.." || exit

# 1. Fix unnecessary breaks
echo "📝 Fixing unnecessary break statements..."
dart fix --apply

# 2. Format all Dart files
echo "📝 Formatting Dart code..."
dart format .

# 3. Run flutter pub get to ensure dependencies are updated
echo "📦 Updating dependencies..."
flutter pub get

# 4. Analyze the project
echo "🔍 Analyzing project..."
flutter analyze

echo "✅ Done! Check the output above for any remaining issues."
