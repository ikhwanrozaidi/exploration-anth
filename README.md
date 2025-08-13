## 🚀 Features

### Authentication & Security

- **Admin Authentication**: Secure login system with JWT token management
- **Device Binding**: Device-specific authentication for enhanced security
- **Auto Token Refresh**: Automatic token renewal for seamless user experience
- **Multi-environment Support**: Development, staging, and production configurations

### Core Functionality

- **Responsive Design**: Optimized for both mobile and tablet devices
- **Modern UI**: Clean, intuitive interface with consistent design patterns
- **Real-time Updates**: Live data synchronization with backend services

### Technical Features

- **Clean Architecture**: Domain-driven design with clear separation of concerns
- **State Management**: BLoC pattern for predictable state management
- **Dependency Injection**: GetIt and Injectable for modular architecture
- **Error Handling**: Comprehensive error handling with custom failure types
- **Network Management**: Dio HTTP client with interceptors and retry logic
- **Local Storage**: Secure local data persistence with SharedPreferences

## 📱 Screenshots

_Screenshots will be added as the application development progresses_

## 🏗️ Architecture

This project follows **Clean Architecture** principles with the following layers:

```
lib/
├── core/                   # Core functionality and shared resources
│   ├── config/            # App configuration and flavor management
│   ├── constants/         # Application constants
│   ├── di/               # Dependency injection setup
│   ├── errors/           # Custom error and failure classes
│   ├── network/          # Network layer with Dio and interceptors
│   ├── services/         # Core services (device info, etc.)
│   └── utils/            # Utility functions and helpers
├── features/              # Feature-based modules
│   ├── auth/             # Authentication feature
│   │   ├── data/         # Data layer (API, models, repositories)
│   │   ├── domain/       # Domain layer (entities, use cases)
│   │   └── presentation/ # Presentation layer (BLoC, pages, widgets)
│   └── device/           # Device management feature
│       ├── data/
│       ├── domain/
│       └── presentation/
├── routes/               # App routing configuration
└── shared/               # Shared UI components and utilities
    ├── models/           # Shared data models
    ├── pages/            # Shared pages
    ├── services/         # Shared services
    └── widgets/          # Reusable UI components
```

## 🛠️ Tech Stack

### Core Technologies

- **Flutter**: Cross-platform mobile framework
- **Dart**: Programming language
- **BLoC**: State management pattern
- **GetIt**: Dependency injection
- **Injectable**: Code generation for DI

### Network & API

- **Dio**: HTTP client for API communication
- **Retrofit**: Type-safe API client generation
- **Pretty Dio Logger**: Network request/response logging

### Data & Storage

- **Freezed**: Immutable data classes and JSON serialization
- **JSON Annotation**: JSON serialization
- **SharedPreferences**: Local data persistence

### UI & Design

- **Flutter ScreenUtil**: Responsive design utilities
- **Google Fonts**: Typography
- **Responsive Framework**: Responsive layout management

### Development Tools

- **Build Runner**: Code generation
- **Flutter Lints**: Code quality and style enforcement

## 🚦 Getting Started

### Prerequisites

- Flutter SDK (>= 3.8.1)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code (recommended IDE)

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd rclink_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code**

   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**

   ```bash
   # Development environment
   flutter run --flavor development --target lib/main_development.dart

   # Staging environment
   flutter run --flavor staging --target lib/main_staging.dart

   # Production environment
   flutter run --flavor production --target lib/main_production.dart
   ```

### Quick Start Scripts

Use the provided shell scripts for easy launching:

```bash
# Development
./scripts/launch_development.sh

# Staging
./scripts/launch_staging.sh

# Production
./scripts/launch_production.sh
```

## 🔧 Configuration

### Environment Setup

The application supports three environments:

- **Development**: `lib/main_development.dart`
- **Staging**: `lib/main_staging.dart`
- **Production**: `lib/main_production.dart`

Each environment has its own configuration in `FlavorConfig`:

```dart
FlavorConfig(
  flavor: Flavor.development,
  appName: 'RCLink (Staging)',
  baseUrl: 'https://api-staging.rclink.my',
  bundleId: 'com.rclink.rclink_app',
  enableLogging: true,
  apiKey: 'dev_api_key_here',
);
```

### API Configuration

The base URL is configured through FlavorConfig in each main entry file:

```dart
FlavorConfig(
  flavor: Flavor.development,
  appName: 'RCLink (Dev)',
  baseUrl: 'https://api-staging.rclink.my',
  bundleId: 'com.rclink.rclink_app.dev',
  enableLogging: true,
  apiKey: 'dev_api_key_here',
);

// lib/main_staging.dart
FlavorConfig(
  flavor: Flavor.staging,
  appName: 'RCLink (Staging)',
  baseUrl: 'https://api-staging.rclink.my',
  bundleId: 'com.rclink.rclink_app.staging',
  enableLogging: true,
  apiKey: 'staging_api_key_here',
);

// lib/main_production.dart
FlavorConfig(
  flavor: Flavor.production,
  appName: 'RCLink',
  baseUrl: 'https://api.rclink.my',
  bundleId: 'com.rclink.rclink_app',
  enableLogging: false,
  apiKey: 'production_api_key_here',
);
```

## 📝 Development Guidelines

### Code Generation

When modifying models or API services, run code generation:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Adding New Features

1. Create feature folder in `lib/features/`
2. Follow the clean architecture structure:
   - `data/` - API services, models, repository implementations
   - `domain/` - Entities, repository interfaces, use cases
   - `presentation/` - BLoC, pages, widgets
3. Register dependencies in `core/di/injection.dart`
4. Add routing in `routes/app_router.dart`

### State Management

Use BLoC pattern for state management:

```dart
// Event
abstract class FeatureEvent extends Equatable {}

// State
abstract class FeatureState extends Equatable {}

// BLoC
class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
  // Implementation
}
```

### Error Handling

Use custom failure classes for error handling:

```dart
abstract class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Test Structure

```
test/
├── unit/          # Unit tests
├── widget/        # Widget tests
└── integration/   # Integration tests
```

## 📦 Build & Deployment

### Android Build

```bash
# Debug APK
flutter build apk --flavor development --target lib/main_development.dart

# Release APK
flutter build apk --release --flavor production --target lib/main_production.dart

# App Bundle
flutter build appbundle --release --flavor production --target lib/main_production.dart
```

### iOS Build

```bash
# Debug
flutter build ios --flavor development --target lib/main_development.dart

# Release
flutter build ios --release --flavor production --target lib/main_production.dart
```

## 🔍 Debugging

### Logging

The application uses different logging levels based on the environment:

- **Development**: Full logging enabled
- **Staging**: Limited logging
- **Production**: Error logging only

### Network Debugging

Use Pretty Dio Logger to inspect network requests:

```dart
if (FlavorConfig.instance.enableLogging) {
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
  ));
}
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/[feature]`)
3. Commit your changes (`git commit -m '[feat|fix|chore]: Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Standards

- Follow Dart/Flutter style guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Ensure all tests pass before submitting PR
- Use conventional commit messages

## 📄 License

This project is proprietary software owned by RCLink. All rights reserved.

---

**Last Updated**: January 2024  
**Version**: 1.0.0  
**Flutter Version**: 3.8.1+