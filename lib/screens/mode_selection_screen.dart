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
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.cardBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppTheme.text,
                        size: 18,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Game Modes',
                    style: AppTheme.headingStyle.copyWith(fontSize: 18),
                  ),
                  const Spacer(),
                  const SizedBox(width: 44),
                ],
              ),
            ).animate().fadeIn(duration: 300.ms),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Offline Mode Card
                    _buildModeCard(
                      context,
                      title: 'Offline',
                      subtitle: 'Campaign Mode',
                      icon: Icons.person,
                      price: 'Free',
                      description: 'Play against AI',
                      color: AppTheme.primary,
                      isActive: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmojiSelectionScreen(),
                          ),
                        );
                      },
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

                    const SizedBox(height: 20),

                    // Online Mode Card
                    _buildModeCard(
                      context,
                      title: 'Online',
                      subtitle: 'Multiplayer',
                      icon: Icons.public,
                      price: 'Free',
                      description: 'Play with friends',
                      color: AppTheme.secondary,
                      isActive: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnlineLoginScreen(),
                          ),
                        );
                      },
                    ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),

                    const SizedBox(height: 20),

                    // Practice Mode Card
                    _buildModeCard(
                      context,
                      title: 'Practice',
                      subtitle: 'Local 2 Player',
                      icon: Icons.people,
                      price: 'Free',
                      description: 'Play offline with friend',
                      color: AppTheme.accent,
                      isActive: false,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Coming soon!'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppTheme.cardBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String price,
    required String description,
    required Color color,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: AppTheme.cardDecoration.copyWith(
          boxShadow: AppTheme.cardShadow,
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),

            const SizedBox(width: 16),

            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.headingStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTheme.captionStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),

            // Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: AppTheme.headingStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: AppTheme.captionStyle.copyWith(fontSize: 11),
                ),
              ],
            ),

            const SizedBox(width: 12),

            // Toggle or arrow
            Container(
              width: 44,
              height: 28,
              decoration: BoxDecoration(
                color: isActive ? AppTheme.success : AppTheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isActive ? AppTheme.success : AppTheme.border,
                ),
              ),
              child: AnimatedAlign(
                alignment: isActive
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
