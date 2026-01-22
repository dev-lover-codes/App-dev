import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'providers/game_provider.dart';
import 'screens/welcome_screen.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase (Replace with your keys)
  try {
    await Supabase.initialize(
      url: 'https://xyzcompany.supabase.co',
      anonKey: 'public-anon-key',
    );
  } catch (e) {
    // Supabase might fail if keys are invalid, but we proceed for Offline mode
    debugPrint("Supabase Init failed (Expected if no keys): $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
      child: MaterialApp(
        title: 'Tic Tac Toe Ultimate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppTheme.primary,
            brightness: Brightness.dark,
            background: AppTheme.background,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: AppTheme.background,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
