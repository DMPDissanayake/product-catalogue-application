# Product Catalogue Application

## Project Overview

Product Catalogue Application is a Flutter mobile app that lets users browse a catalogue of products, search for items, view detailed product information, and save products to a favourites list. It is built with a clean, feature-based architecture and uses the BLoC pattern for state management, making the codebase predictable, testable, and easy to extend.

Key features:
- Browse products in a responsive grid with shimmer loading states
- Search products by keyword / category
- View detailed information for a single product
- Add/remove products to a persistent Favourites list (saved locally on the device)
- Light / dark theme support

## Screenshots

### Light Mode
<p>
  <img width="270" alt="Light mode screenshot 1" src="https://github.com/user-attachments/assets/f0fdd412-7b41-4c57-bc2d-385fb50500dc" />
  <img width="270" alt="Light mode screenshot 2" src="https://github.com/user-attachments/assets/0b44b6d6-7dc6-4e32-b763-2ccab5b1aa36" />
  <img width="270" alt="Light mode screenshot 3" src="https://github.com/user-attachments/assets/c505d363-2bb0-49f5-828b-51b4a3d736c5" />
</p>

### Dark Mode
<p>
  <img width="270" alt="Dark mode screenshot 1" src="https://github.com/user-attachments/assets/77b1d446-8b2d-4819-bf93-dfdbe193143c" />
  <img width="270" alt="Dark mode screenshot 2" src="https://github.com/user-attachments/assets/fe071c44-6340-4813-8768-3928fc3532c2" />
  <img width="270" alt="Dark mode screenshot 3" src="https://github.com/user-attachments/assets/bb5d45db-9a08-4694-9e66-bf5fc65a5db4" />
</p>

## Setup Instructions

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.10.3 or higher (Dart comes bundled with Flutter)
- Android Studio / VS Code with Flutter & Dart plugins
- An Android emulator, iOS simulator, or a physical device

### 1. Install dependencies
```bash
git clone https://github.com/DMPDissanayake/product-catalogue-application.git
cd product-catalogue-application
flutter pub get
```

### 2. Run the project
```bash
# Run on a connected device/emulator (debug mode)
flutter run

# Or target a specific device
flutter devices              # list available devices
flutter run -d <device_id>
```

### 3. Build an APK
```bash
# Release APK (recommended for sharing/installing on a device)
flutter build apk --release

# Split per ABI (smaller file size)
flutter build apk --split-per-abi

# Debug APK (for quick testing)
flutter build apk --debug
```
The generated APK(s) will be located at:
```
build/app/outputs/flutter-apk/
```

## Architecture

### Folder Structure
```
lib/
├── app/                       # App root widget & MaterialApp setup
├── core/
│   ├── di/                    # Simple dependency injection / service locator
│   ├── network/                # ApiHelper interface + Mock API implementation
│   ├── storage/                # SharedPreferences wrapper (AppShared)
│   └── theme/                  # App colors, theming, theme Cubit
├── features/
│   └── products/
│       ├── data/
│       │   ├── models/         # Request/response & data models
│       │   └── repositories/   # Repository implementation (talks to ApiHelper)
│       ├── domain/
│       │   ├── entities/       # Product & ProductDetail entities
│       │   └── repositories/   # Repository contracts (interfaces)
│       └── presentation/
│           ├── bloc/           # ProductBloc – listing & search
│           ├── cubit/          # FavoriteCubit – favourites toggle/state
│           ├── view/            # Screens (list, detail, favourites)
│           └── widgets/         # Reusable UI components
├── services/                    # FavouritesStorageService (local persistence)
├── utils/                       # Constants, dimensions, enums, routes, animations
└── main.dart                     # App entry point
```
Each feature follows a **data → domain → presentation** layering so that UI code never talks to the network/storage layer directly — it always goes through a repository, keeping business logic testable and decoupled from Flutter widgets.

### State Management Approach
State management is handled with **flutter_bloc**:
- **BLoC (`ProductBloc`)** manages product listing and search — it reacts to events (e.g. "load products", "search products") and emits states (loading, loaded, error) that the UI listens to with `BlocBuilder`/`BlocListener`.
- **Cubit (`FavoriteCubit`)** manages the simpler favourites toggle logic, since it doesn't need the full event-based structure of a BLoC.
- A **`ThemeCubit`** manages light/dark theme state app-wide.

This gives a unidirectional data flow: UI dispatches an event/method call → BLoC/Cubit processes it (via the repository) → a new state is emitted → UI rebuilds reactively.

### API Integration Approach
Networking is abstracted behind an `ApiHelper` interface (`get` / `post`), so the rest of the app (repositories, BLoCs) depends only on that abstraction rather than a concrete HTTP client. Currently a `MockAPIHelper` implementation is wired up via dependency injection, which simulates network latency and returns realistic mock JSON for endpoints such as:
- `product/list` – product listing
- `product/search` – search by query/category
- `product/data` – single product detail by ID

Because the app depends on the `ApiHelper` interface, swapping the mock implementation for a real HTTP client (e.g. `dio` or `http`) later only requires writing a new implementation of that interface — no changes to the BLoC or UI layers.

Favourites are persisted locally using `SharedPreferences` (wrapped by `AppShared`), storing favourite products as JSON so they survive app restarts.

## Assumptions

- No real backend/API was provided for this assignment, so a mock API layer (`MockAPIHelper`) was built to simulate realistic network calls (including delay) and return representative product data.
- Favourites only need to persist locally on-device; no user accounts or server-side sync were assumed to be in scope.
- The product data shape (id, name, price, category, image, etc.) was assumed based on typical e-commerce catalogue apps, since no fixed schema was supplied.
- Only Android/iOS were treated as primary target platforms; desktop/web build folders exist by default from `flutter create` but weren't a focus of testing.

## Challenges

- **No live API to integrate against** — handled by designing an `ApiHelper` abstraction first and building a mock implementation behind it, so the app functions end-to-end and a real API can be swapped in later without touching UI or state-management code.
- **Keeping favourites in sync across screens** (list, detail, favourites tab) — solved by centralizing favourite state in a single `FavoriteCubit` and persisting via `FavouritesStorageService`, so all screens read from the same source of truth.
- **Responsive UI across different device sizes** — addressed using `flutter_screenutil` to scale dimensions consistently rather than hardcoding pixel values.

## Improvements

- Replace the mock API layer with a real backend integration (e.g. using `dio` with proper error handling, pagination, and retries).
- Add unit and widget tests for BLoC/Cubit logic and key screens.
- Add pagination/infinite scroll for large product lists instead of loading everything at once.
- Introduce a proper caching layer (e.g. `hive` or `sqflite`) for offline support beyond just favourites.
- Add sorting/filtering options (price, category, rating) on the product listing screen.
- Add CI (GitHub Actions) to run `flutter analyze` and tests automatically on push.
