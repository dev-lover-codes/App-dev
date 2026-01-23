# 🚀 Development Workflow Guide

## Quick Reference for Development

This document provides quick commands and workflows for common development tasks.

---

## 🔧 Daily Development Commands

### Starting Development

```bash
# 1. Pull latest changes (if working with Git)
git pull

# 2. Get latest dependencies
flutter pub get

# 3. Run the app
flutter run              # Auto-detect device
flutter run -d chrome    # Run on Chrome
flutter run -d android   # Run on Android
```

### During Development

```bash
# Hot reload (in running app terminal)
r           # Reload
R           # Restart app
q           # Quit

# Check for issues
flutter analyze

# Format code
dart format lib/

# Run tests
flutter test
```

### Before Committing

```bash
# 1. Format all code
dart format .

# 2. Analyze for issues
flutter analyze

# 3. Test
flutter test

# 4. Build to verify
flutter build apk --release
```

---

## 📱 Building & Testing

### Debug Builds (Fast)

```bash
# Android Debug
flutter build apk --debug

# Install on connected device
flutter install
```

### Release Builds (Optimized)

```bash
# Android Release APK
flutter build apk --release

# App Bundle (for Play Store)
flutter build appbundle --release

# iOS Release
flutter build ios --release

# Web Release
flutter build web --release
```

### Finding Your APK

```bash
# Release APK location:
build/app/outputs/flutter-apk/app-release.apk

# App Bundle location:
build/app/outputs/bundle/release/app-release.aab
```

---

## 🎨 Working with Assets

### Adding New Assets

1. Add file to `assets/` folder
2. Update `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/icons/
       - assets/images/new_image.png
   ```
3. Run:
   ```bash
   flutter pub get
   ```

### Updating App Icon

1. Replace `assets/icons/app_icon.png`
2. Run:
   ```bash
   dart run flutter_launcher_icons
   ```
3. Rebuild app

---

## 📦 Managing Dependencies

### Adding a New Package

1. Find package on [pub.dev](https://pub.dev)
2. Add to `pubspec.yaml`:
   ```yaml
   dependencies:
     package_name: ^version
   ```
3. Run:
   ```bash
   flutter pub get
   ```
4. Import in Dart:
   ```dart
   import 'package:package_name/package_name.dart';
   ```

### Updating Packages

```bash
# Update all to latest compatible
flutter pub upgrade

# Update to specific version
# Edit pubspec.yaml then:
flutter pub get

# Check outdated packages
flutter pub outdated
```

---

## 🐛 Debugging

### Common Debug Commands

```bash
# Show connected devices
flutter devices

# Show detailed logs
flutter run --verbose

# Clear cache
flutter clean

# Doctor (check setup)
flutter doctor
flutter doctor -v
```

### Performance Profiling

```bash
# Run in profile mode
flutter run --profile

# Open DevTools
flutter pub global activate devtools
flutter pub global run devtools
```

---

## 🔄 Git Workflow (When Ready to Commit)

### Daily Workflow

```bash
# 1. Check status
git status

# 2. See changes
git diff

# 3. Add files
git add .
# OR add specific files
git add lib/screens/new_screen.dart

# 4. Commit
git commit -m "Add new feature: description"

# 5. Push (when you're ready)
# git push
```

### Good Commit Messages

```bash
# Feature
git commit -m "Add dark mode toggle"

# Fix
git commit -m "Fix win detection bug"

# UI
git commit -m "Update welcome screen design"

# Refactor
git commit -m "Refactor AI service for better performance"
```

---

## 📝 Code Snippets

### Creating a New Screen

```dart
// lib/screens/new_screen.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Your content here
            ],
          ),
        ),
      ),
    );
  }
}
```

### Adding to Navigation

```dart
// In button onTap:
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const NewScreen(),
  ),
);

// Going back:
Navigator.pop(context);
```

### Using Provider

```dart
// Reading state
final gameProvider = Provider.of<GameProvider>(context);

// Or with Consumer
Consumer<GameProvider>(
  builder: (context, gameProvider, child) {
    return Text(gameProvider.winner ?? 'Playing');
  },
)

// Updating state (call provider method)
Provider.of<GameProvider>(context, listen: false).makeMove(0);
```

### Creating a Card

```dart
Container(
  padding: const EdgeInsets.all(20),
  decoration: AppTheme.cardDecoration.copyWith(
    boxShadow: AppTheme.cardShadow,
  ),
  child: Column(
    children: [
      // Card content
    ],
  ),
)
```

### Creating a Button

```dart
GestureDetector(
  onTap: () {
    // Action
  },
  child: Container(
    width: double.infinity,
    height: 56,
    decoration: BoxDecoration(
      gradient: AppTheme.accentGradient,
      borderRadius: BorderRadius.circular(16),
      boxShadow: AppTheme.buttonShadow,
    ),
    child: Center(
      child: Text(
        'Button Text',
        style: AppTheme.buttonTextStyle,
      ),
    ),
  ),
)
```

---

## 🎯 Workflow for Different Tasks

### Adding a New Feature

1. **Plan**
   - Sketch UI
   - Define state needed
   - List components

2. **Create**
   - Create screen file
   - Add to navigation
   - Build UI

3. **Connect Logic**
   - Add state to provider
   - Connect UI to state
   - Test functionality

4. **Polish**
   - Add animations
   - Test edge cases
   - Refine design

5. **Commit**
   ```bash
   git add .
   git commit -m "Add new feature"
   ```

### Fixing a Bug

1. **Reproduce**
   - Understand the bug
   - Find steps to reproduce

2. **Locate**
   - Check relevant files
   - Add debug prints
   - Use debugger

3. **Fix**
   - Make minimal changes
   - Test fix

4. **Verify**
   - Test edge cases
   - Ensure no new bugs

5. **Commit**
   ```bash
   git commit -m "Fix: description of bug"
   ```

### Updating UI Design

1. **Update Theme**
   - Edit `app_theme.dart`
   - Change colors/styles

2. **Update Screens**
   - Modify screen files
   - Hot reload to see changes

3. **Test**
   - Check all screens
   - Verify consistency

4. **Commit**
   ```bash
   git commit -m "Update UI design: changes made"
   ```

---

## 🚨 Emergency Fixes

### App Won't Build

```bash
# Nuclear option - fixes most issues
flutter clean
rm -rf ios/Pods
rm ios/Podfile.lock
flutter pub get
cd ios && pod install
cd ..
flutter run
```

### Dependencies Issues

```bash
# Reset dependencies
rm pubspec.lock
flutter pub get
```

### Android Build Issues

```bash
# Clean Android build
cd android
./gradlew clean
cd ..
flutter clean
flutter build apk
```

### iOS Build Issues

```bash
# Clean iOS build
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter clean
flutter build ios
```

---

## 📊 Performance Tips

### Keep Build Fast

- Only import needed packages
- Use `const` constructors
- Avoid rebuilding entire widget tree
- Use `Consumer` for targeted rebuilds

### Optimize Images

- Use appropriate sizes
- Compress images
- Use caching

### Code Organization

- Keep files under 500 lines
- Split large widgets
- Use separate files for components

---

## 🎓 Best Practices

### Code Style

```dart
// ✅ Good
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Text('Hello'),
    );
  }
}

// ❌ Avoid
class mywidget extends StatelessWidget {
  Widget build(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('Hello')
    );
  }
}
```

### File Naming

- Use snake_case: `welcome_screen.dart`
- Match class name: `WelcomeScreen` in `welcome_screen.dart`
- Group related files in folders

### Comments

```dart
// ✅ Good - explain WHY
// Using minimax for optimal AI play
final move = AIService.playHard(board, 'O');

// ❌ Unnecessary - code is self-explanatory
// Set the text color to white
color: Colors.white
```

---

## 📱 Testing on Devices

### Android

```bash
# List devices
adb devices

# Install APK
adb install build/app/outputs/flutter-apk/app-release.apk

# View logs
adb logcat
```

### iOS (macOS only)

```bash
# List devices
instruments -s devices

# Install
flutter install -d <device_id>
```

---

## 🔒 Version Control Best Practices

### What to Commit

- ✅ Source code (`lib/`)
- ✅ Assets (`assets/`)
- ✅ Config files (`pubspec.yaml`)
- ✅ Documentation (`.md` files)

### What NOT to Commit

- ❌ `build/` folder
- ❌ `.dart_tool/` folder
- ❌ `ios/Pods/` folder
- ❌ `android/.gradle/` folder
- ❌ IDE configs (`.idea/`, `.vscode/`)

These are already in `.gitignore`

---

## 🎯 Quick Checklist Before Release

- [ ] All features working
- [ ] No console errors
- [ ] Tested on multiple devices
- [ ] App icon updated
- [ ] App name correct
- [ ] Version number updated
- [ ] Build successful
- [ ] APK tested on real device
- [ ] Git committed
- [ ] Documentation updated

---

## 📞 Getting Help

### Resources

- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
- [Flutter Discord](https://discord.gg/flutter)
- [Flutter Docs](https://docs.flutter.dev/)
- [Pub.dev](https://pub.dev/)

### Common Search Terms

- "Flutter [your issue]"
- "Flutter [widget name] example"
- "Flutter [error message]"

---

**Happy Coding! 🚀**

_Quick reference guide for XO Neon development_
