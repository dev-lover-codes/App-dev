# Tic Tac Toe - Flutter App

A feature-rich Tic Tac Toe mobile application built with Flutter, featuring offline AI gameplay with multiple difficulty levels, online multiplayer mode, and a stunning modern UI.

## 🎮 Features

### Offline Mode

- **3 Difficulty Levels**: Easy, Medium, and Hard AI opponents
- **Smart AI**: Powered by Minimax algorithm with alpha-beta pruning
- **Level Progression**: Star-based progression system
- **Custom Emojis**: Choose your favorite emoji as your game piece

### Online Mode

- **Real-time Multiplayer**: Play with friends online
- **QR Code Sharing**: Quick lobby joining via QR codes
- **User Search**: Find and invite players globally
- **Invite Links**: Share game invites easily

### UI/UX

- **Modern Design**: Gradient backgrounds and glassmorphic effects
- **Smooth Animations**: Flutter Animate for polished transitions
- **Responsive Layout**: Works on all screen sizes
- **Dark Theme**: Eye-friendly dark mode

## 📱 Download

The latest release APK can be found in:

```
build/app/outputs/flutter-apk/app-release.apk
```

**APK Size**: ~48 MB  
**Minimum Android Version**: Android 5.0 (API 21)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator

### Installation

1. Clone the repository:

```bash
git clone https://github.com/dev-lover-codes/App-dev.git
cd "tic tac toe app"
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

### Build APK

To build a release APK:

```bash
flutter build apk --release
```

The APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`

## 📦 Dependencies

- **flutter_animate**: For smooth animations
- **provider**: State management
- **qr_flutter**: QR code generation
- **supabase_flutter**: Backend for online features (planned)

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point
├── providers/                   # State management
│   └── game_provider.dart
├── screens/                     # All app screens
│   ├── welcome_screen.dart
│   ├── mode_selection_screen.dart
│   ├── emoji_selection_screen.dart
│   ├── offline_levels_screen.dart
│   ├── stages_screen.dart
│   ├── game_screen.dart
│   ├── online_login_screen.dart
│   └── online_match_screen.dart
├── services/                    # Business logic
│   └── ai_service.dart
└── utils/                       # Utilities
    └── app_theme.dart
```

## 🎨 Screenshots

_(Screenshots coming soon)_

## 🛠️ Development

This project is built with:

- **Flutter**: Cross-platform framework
- **Dart**: Programming language
- **Material Design 3**: UI components

## 🐛 Known Issues

- Online multiplayer is currently in development (mock UI only)
- Supabase integration pending

## 📝 License

This project is open source and available under the MIT License.

## 👨‍💻 Developer

Created by [dev-lover-codes](https://github.com/dev-lover-codes)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

---

**Enjoy playing Tic Tac Toe! 🎮✨**
