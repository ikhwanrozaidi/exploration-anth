# 🚀 RCLink Flavor Setup Guide

This document provides a complete guide for using the flavor system that has been set up for the RCLink Flutter application.

## 📋 Overview

The application now supports three distinct environments:

- **Development** - For development and testing
- **Staging** - For pre-production testing
- **Production** - For live production releases

Each flavor has its own configuration, bundle IDs, and API endpoints.

## 🏗️ Architecture

### Flavor Configuration Structure

```
lib/
├── core/
│   └── config/
│       └── flavor_config.dart          # Core flavor configuration
├── main_development.dart                # Development entry point
├── main_staging.dart                   # Staging entry point
├── main_production.dart                # Production entry point
└── main.dart                           # Shared app logic
```

### Configuration Details

| Environment | App Name         | Bundle ID                     | Base URL                      | Logging  |
| ----------- | ---------------- | ----------------------------- | ----------------------------- | -------- |
| Development | RCLink (Dev)     | com.rclink.rclink_app.dev     | https://api-staging.rclink.my | Enabled  |
| Staging     | RCLink (Staging) | com.rclink.rclink_app.staging | https://api-staging.rclink.my | Enabled  |
| Production  | RCLink           | com.rclink.rclink_app         | https://api.rclink.my         | Disabled |

## 🚀 Running Different Flavors

### Method 1: Using Launch Scripts (Recommended)

The easiest way to run different flavors:

```bash
# Development
./scripts/launch_development.sh

# Staging
./scripts/launch_staging.sh

# Production
./scripts/launch_production.sh
```

### Method 1b: Using iOS Schemes in Xcode

When working in Xcode, you can now select different schemes:

- **Development** scheme → Runs development flavor
- **Staging** scheme → Runs staging flavor
- **Production** scheme → Runs production flavor
- **Runner** scheme → Original default scheme

### Method 2: Direct Flutter Commands

You can also run flavors directly using Flutter CLI:

```bash
# Development
flutter run --flavor development --target lib/main_development.dart

# Staging
flutter run --flavor staging --target lib/main_staging.dart

# Production
flutter run --flavor production --target lib/main_production.dart
```

### Method 3: With Additional Parameters

Pass additional Flutter parameters through the scripts:

```bash
# Run development on specific device
./scripts/launch_development.sh -d "iPhone 15 Pro"

# Run staging in release mode
./scripts/launch_staging.sh --release

# Run with custom parameters
./scripts/launch_production.sh --hot --verbose
```

## 📱 Platform-Specific Configurations

### Android

Android flavors are configured in `android/app/build.gradle.kts`:

- **development**: `com.rclink.rclink_app.dev`
- **staging**: `com.rclink.rclink_app.staging`
- **production**: `com.rclink.rclink_app`

Each flavor automatically gets the correct app name and can be installed side by side.

### iOS

iOS configurations are set up with separate xcconfig files and schemes:

**Configuration Files:**

- `ios/Flutter/Development.xcconfig`
- `ios/Flutter/Staging.xcconfig`
- `ios/Flutter/Production.xcconfig`

**Schemes:**

- `Development.xcscheme` - Uses Debug configuration, targets `main_development.dart`
- `Staging.xcscheme` - Uses Debug configuration, targets `main_staging.dart`
- `Production.xcscheme` - Uses Release configuration, targets `main_production.dart`
- `Runner.xcscheme` - Original default scheme

## 🔧 Building for Release

### Android APK/Bundle

```bash
# Development APK
flutter build apk --flavor development --target lib/main_development.dart

# Staging App Bundle
flutter build appbundle --flavor staging --target lib/main_staging.dart

# Production Release
flutter build appbundle --release --flavor production --target lib/main_production.dart
```

### iOS

```bash
# Development
flutter build ios --flavor development --target lib/main_development.dart

# Staging
flutter build ios --flavor staging --target lib/main_staging.dart

# Production
flutter build ios --release --flavor production --target lib/main_production.dart
```

## 🎯 Using FlavorConfig in Your Code

The `FlavorConfig` class provides easy access to environment-specific settings:

```dart
import 'package:rclink_app/core/config/flavor_config.dart';

// Access current configuration
String appName = FlavorConfig.instance.appName;
String baseUrl = FlavorConfig.instance.baseUrl;
bool shouldLog = FlavorConfig.instance.enableLogging;

// Check current flavor
if (FlavorConfig.isDevelopment) {
  // Development-specific code
}

if (FlavorConfig.isProduction) {
  // Production-specific code
}

// Get flavor name as string
String flavorName = FlavorConfig.flavorName; // "development", "staging", "production"
```
