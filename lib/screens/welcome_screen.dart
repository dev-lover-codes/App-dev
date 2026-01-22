import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../utils/app_theme.dart';
import 'mode_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Title
              Text(
                "TIC TAC TOE",
                style: AppTheme.titleStyle.copyWith(fontSize: 48),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0),

              const SizedBox(height: 20),

              Text(
                "Ultimate Edition",
                style: AppTheme.headingStyle.copyWith(color: Colors.white70),
              ).animate().fadeIn(delay: 300.ms),

              const Spacer(),

              // Glowing Icon
              Icon(Icons.grid_4x4, size: 100, color: Colors.white)
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 2000.ms, color: AppTheme.secondary),

              const Spacer(),

              // Play Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModeSelectionScreen(),
                      ),
                    );
                  },
                  child:
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: AppTheme.secondaryGradient,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.secondary.withOpacity(0.5),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text("PLAY", style: AppTheme.buttonTextStyle),
                        ),
                      ).animate().scale(
                        delay: 500.ms,
                        duration: 400.ms,
                        curve: Curves.elasticOut,
                      ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
