# Product Catalogue Application

A cross-platform Flutter application for browsing products, searching by keyword or category, viewing detailed product information, and managing a persistent list of favourite products.

Built with Flutter and Dart, the application follows a feature-based architecture and uses the BLoC pattern for predictable state management, maintainable code, and easier testing. The application supports **Android and iOS**, with light and dark themes for a consistent user experience across both platforms.

## Features

- **Product Listing** — Displays products in a responsive grid with shimmer loading placeholders while data is being fetched.
- **Product Search** — Search products by keyword and filter by category using `ProductBloc`.
- **Product Details** — View detailed information about individual products, including their names, prices, categories, images, and other available product information.
- **Favourites Management** — Add or remove products from favourites with a single tap. Favourite products are stored locally using `SharedPreferences` and remain available after restarting the application.
- **Light and Dark Themes** — Switch between light and dark modes at runtime using `ThemeCubit`.
- **Smooth Navigation** — Custom page transitions using `page_transition` for a polished navigation experience.
- **Responsive UI** — Uses `flutter_screenutil` to help adapt layouts to different screen sizes and resolutions.
- **Cross-Platform Support** — Supports Android and iOS devices through a shared Flutter codebase.
- **Loading Animations** — Uses shimmer placeholders and staggered animations to improve the loading experience.

## Screenshots

### Light Mode

<p align="center">
  <img width="270" alt="Light mode screenshot 1" src="https://github.com/user-attachments/assets/f0fdd412-7b41-4c57-bc2d-385fb50500dc" />
  <img width="270" alt="Light mode screenshot 2" src="https://github.com/user-attachments/assets/0b44b6d6-7dc6-4e32-b763-2ccab5b1aa36" />
  <img width="270" alt="Light mode screenshot 3" src="https://github.com/user-attachments/assets/c505d363-2bb0-49f5-828b-51b4a3d736c5" />
</p>

### Dark Mode

<p align="center">
  <img width="270" alt="Dark mode screenshot 1" src="https://github.com/user-attachments/assets/77b1d446-8b2d-4819-bf93-dfdbe193143c" />
  <img width="270" alt="Dark mode screenshot 2" src="https://github.com/user-attachments/assets/fe071c44-6340-4813-8768-3928fc3532c2" />
  <img width="270" alt="Dark mode screenshot 3" src="https://github.com/user-attachments/assets/bb5d45db-9a08-4694-9e66-bf5fc65a5db4" />
</p>

*The application UI is designed to provide a consistent experience across supported mobile platforms.*

## Supported Platforms

| Platform | Support |
|---|---|
| Android | Supported |
| iOS | Supported |

The application uses a shared Flutter codebase for both platforms, allowing most UI components, business logic, and state management to be maintained in one place.

## Prerequisites

Before running the project, ensure that you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK (included with Flutter)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with the Flutter and Dart extensions
- Git

### For Android Development

- Android Studio with the Android SDK
- An Android emulator or a physical Android device
- Appropriate Android SDK and build tools

### For iOS Development

- A Mac running a supported version of macOS
- [Xcode](https://developer.apple.com/xcode/) with the required iOS SDK
- Xcode command-line tools
- An iOS simulator or a physical iPhone
- Apple Developer account and signing configuration when required for device deployment or distribution

**Note:** iOS applications must be built using macOS and Xcode. You can develop Flutter code on other operating systems, but you cannot produce a native iOS build directly on Windows or Linux.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/DMPDissanayake/product-catalogue-application.git

cd product-catalogue-application
```

### 2. Install Dependencies

Fetch the required Flutter packages:

```bash
flutter pub get
```

### 3. Check the Development Environment

Run Flutter's diagnostic tool to verify your development setup:

```bash
flutter doctor
```

Resolve any reported issues related to the platform you intend to use.

### 4. Check Available Devices

```bash
flutter devices
```

This command lists available emulators, simulators, and connected devices.

### 5. Run the Application

Run the application on the default available device:

```bash
flutter run
```

To target a specific device:

```bash
flutter run -d <device_id>
```

Replace `<device_id>` with the ID displayed by `flutter devices`.

## Building the Application

### Android

#### Build a Release APK

```bash
flutter build apk --release
```

The generated APK is available at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

#### Build APKs for Individual Architectures

```bash
flutter build apk --split-per-abi
```

This generates smaller APK files for supported Android CPU architectures.

#### Build an Android App Bundle

```bash
flutter build appbundle --release
```

An Android App Bundle (`.aab`) is commonly used when publishing an application through Google Play.

### iOS

**Requirements:** macOS and Xcode.

#### Build for iOS

```bash
flutter build ios --release
```

This builds the iOS application. Device deployment and distribution may require appropriate Apple code-signing configuration.

#### Build an iOS Simulator Version

```bash
flutter build ios --simulator
```

This produces a build for the iOS simulator.

#### Open the iOS Project in Xcode

```bash
open ios/Runner.xcworkspace
```

Use the workspace to configure signing, select a development team, manage build settings, and run the application on a simulator or physical iPhone.

For additional details, refer to the official [Flutter iOS deployment guide](https://docs.flutter.dev/deployment/ios).

## Project Architecture

The application follows a feature-based architecture with separate data, domain, and presentation layers.

### Folder Structure

```text
lib/
├── app/                       # Application root and MaterialApp setup
├── core/
│   ├── di/                    # Dependency injection and service locator
│   ├── network/               # ApiHelper interface and mock API
│   ├── storage/               # SharedPreferences wrapper
│   └── theme/                 # App colors, themes, and ThemeCubit
├── features/
│   └── products/
│       ├── data/
│       │   ├── models/         # Data and response models
│       │   └── repositories/   # Repository implementations
│       ├── domain/
│       │   ├── entities/       # Product and product detail entities
│       │   └── repositories/   # Repository contracts
│       └── presentation/
│           ├── bloc/           # ProductBloc for listing and search
│           ├── cubit/          # FavoriteCubit for favourites
│           ├── view/            # Product, detail, and favourites screens
│           └── widgets/         # Reusable UI components
├── services/                    # Favourites storage service
├── utils/                       # Constants, dimensions, routes, animations
└── main.dart                    # Application entry point
```

### Architecture Overview

The application separates responsibilities into three main layers:

- **Data Layer** — Handles data models, API communication abstractions, and repository implementations.
- **Domain Layer** — Defines core product entities and repository contracts independently of the UI.
- **Presentation Layer** — Contains screens, reusable widgets, BLoC, and Cubit state management.

This separation helps keep the UI independent of the underlying data implementation and makes the application easier to test and extend.

## State Management

State management is implemented using `flutter_bloc`.

### ProductBloc

Manages product listing and search operations.

Responsibilities include:
- Loading products.
- Searching products by keyword.
- Filtering products by category.
- Emitting loading, success, and error states.

### FavoriteCubit

Manages favourite product state and user interactions.

Responsibilities include:
- Adding products to favourites.
- Removing products from favourites.
- Keeping favourite state synchronized across relevant screens.
- Working with local persistence to retain favourites between app sessions.

### ThemeCubit

Manages the application's theme state.

Responsibilities include:
- Switching between light and dark themes.
- Updating the application theme at runtime.
- Keeping the visual appearance consistent across screens.

## API Integration

Network communication is abstracted through an `ApiHelper` interface that provides `get` and `post` operations.

The current implementation uses `MockAPIHelper` to simulate network requests, introduce realistic delays, and return representative product data.

The mock API supports the following endpoints:

| Endpoint | Purpose |
|---|---|
| `product/list` | Retrieves the product listing |
| `product/search` | Searches products by keyword or category |
| `product/data` | Retrieves details for a specific product |

The abstraction allows a real backend to be integrated later without requiring major changes to the presentation layer.

## Local Data Persistence

Favourite products are stored locally using `SharedPreferences`, accessed through the application's storage abstraction and favourites storage service.

The persistence mechanism allows users to:
- Save favourite products.
- Remove products from their favourites.
- Retain favourite selections after restarting the application.

No account registration or server-side synchronisation is currently required.

## Assumptions and Design Decisions

- **Mock API:** A real backend was not provided, so a mock API implementation was created to demonstrate the application's complete product browsing and search workflow.
- **Product Data:** The product model was designed around common catalogue fields such as ID, name, price, category, and image.
- **Local Favourites:** Favourite products are stored on the device; user accounts and server-side synchronisation are outside the current scope.
- **Cross-Platform Development:** Android and iOS are the primary supported mobile platforms, using Flutter's shared codebase.
- **Native Platform Configuration:** Platform-specific settings, dependencies, and build requirements may still apply to Android and iOS.
- **Splash Screen:** A native splash screen was added to provide a branded launch experience while the application initializes.

## Challenges and Solutions

### 1. No Live Backend API

**Challenge:** A production API was not available for integration.

**Solution:** Introduced an `ApiHelper` abstraction and a mock API implementation to simulate network requests. This keeps the data layer replaceable when a real backend becomes available.

### 2. Responsive UI Across Different Devices

**Challenge:** Maintaining a consistent layout across devices with different screen sizes and resolutions.

**Solution:** Used `flutter_screenutil` and responsive layout techniques to help maintain consistent spacing, sizing, and presentation.

### 3. Smooth Loading Experience

**Challenge:** Avoiding abrupt UI changes while product data is loading.

**Solution:** Integrated shimmer placeholders and staggered animations to provide visual feedback and improve the browsing experience.

### 4. Cross-Platform Compatibility

**Challenge:** Supporting Android and iOS while maintaining a consistent application experience.

**Solution:** Used Flutter's shared UI and business logic, while accounting for platform-specific build tools, configuration, and deployment requirements.

### 5. Persistent Favourite State

**Challenge:** Keeping favourite selections available after an application restart and synchronized across screens.

**Solution:** Implemented `FavoriteCubit` alongside local persistence using `SharedPreferences`.

## Future Improvements

Potential improvements include:

- Replace the mock API with a production backend using `dio` or another HTTP client.
- Implement API error handling, request retries, and pagination.
- Add unit tests for repositories, BLoCs, and Cubits.
- Add widget tests for important application screens.
- Introduce a caching layer for improved offline support.
- Add product sorting and advanced filtering options.
- Improve accessibility and support for different text scaling settings.
- Configure continuous integration with GitHub Actions to run analysis and tests automatically.
- Prepare platform-specific release configurations and distribution workflows for Google Play and the Apple App Store.

## Technologies Used

- **Flutter** — Cross-platform application development
- **Dart** — Programming language
- **flutter_bloc** — State management
- **SharedPreferences** — Local persistence
- **flutter_screenutil** — Responsive sizing
- **shimmer** — Loading placeholders
- **flutter_staggered_animations** — UI animations
- **page_transition** — Custom page transitions

## License

No license has been specified for this project. If you intend to make the repository available for reuse, consider adding an appropriate `LICENSE` file.
