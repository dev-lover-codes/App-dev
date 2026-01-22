import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import 'emoji_selection_screen.dart';
import 'online_login_screen.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Text(
                      "Choose Your Mode",
                      style: AppTheme.headingStyle.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48), // Balance for back button
                  ],
                ),
              ).animate().fadeIn().slideY(begin: -0.5, end: 0),

              const SizedBox(height: 20),

              // Mode Cards
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Offline Mode Card
                      _buildEnhancedModeCard(
                            context,
                            title: "OFFLINE MODE",
                            subtitle: "Play against AI",
                            description: "3 difficulty levels with smart AI",
                            icon: Icons.gamepad_rounded,
                            gradient: AppTheme.primaryGradient,
                            accentColor: AppTheme.primary,
                            features: [
                              "🎮 Campaign Mode",
                              "🤖 Smart AI",
                              "⭐ Star System",
                            ],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EmojiSelectionScreen(),
                                ),
                              );
                            },
                          )
                          .animate()
                          .fadeIn(delay: 200.ms, duration: 600.ms)
                          .slideX(
                            begin: -0.3,
                            end: 0,
                            curve: Curves.easeOutCubic,
                          )
                          .shimmer(delay: 1000.ms, duration: 1500.ms),

                      const SizedBox(height: 25),

                      // Divider with "OR"
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.white.withOpacity(0.3),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).animate().fadeIn(delay: 400.ms),

                      const SizedBox(height: 25),

                      // Online Mode Card
                      _buildEnhancedModeCard(
                            context,
                            title: "ONLINE MODE",
                            subtitle: "Multiplayer Battles",
                            description: "Compete with players worldwide",
                            icon: Icons.public_rounded,
                            gradient: AppTheme.secondaryGradient,
                            accentColor: AppTheme.secondary,
                            features: [
                              "🌍 Global Players",
                              "🔗 QR Join",
                              "🏆 Leaderboard",
                            ],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OnlineLoginScreen(),
                                ),
                              );
                            },
                          )
                          .animate()
                          .fadeIn(delay: 400.ms, duration: 600.ms)
                          .slideX(
                            begin: 0.3,
                            end: 0,
                            curve: Curves.easeOutCubic,
                          )
                          .shimmer(delay: 1200.ms, duration: 1500.ms),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedModeCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required Gradient gradient,
    required Color accentColor,
    required List<String> features,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Gradient overlay on top
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [accentColor.withOpacity(0.1), Colors.transparent],
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Icon container
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: gradient,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(icon, color: Colors.white, size: 36),
                      ),

                      const SizedBox(width: 16),

                      // Title and subtitle
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTheme.headingStyle.copyWith(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              style: AppTheme.bodyStyle.copyWith(
                                color: accentColor.withOpacity(0.8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Arrow
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: accentColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Feature tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: features.map((feature) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: accentColor.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          feature,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 11,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
