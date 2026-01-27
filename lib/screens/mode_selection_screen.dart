import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import 'emoji_selection_screen.dart';
import 'online_login_screen.dart';

class ModeSelectionScreen extends StatefulWidget {
  const ModeSelectionScreen({super.key});

  @override
  State<ModeSelectionScreen> createState() => _ModeSelectionScreenState();
}

class _ModeSelectionScreenState extends State<ModeSelectionScreen> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 900;
            return isDesktop
                ? _buildDesktopLayout(context)
                : _buildMobileLayout(context);
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Bar
        _buildAppBar(context),

        const SizedBox(height: 20),

        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your',
                style: AppTheme.displayLarge.copyWith(
                  fontSize: 36,
                  color: AppTheme.textSecondary,
                ),
              ),
              Text(
                'Battle Mode',
                style: AppTheme.displayLarge.copyWith(fontSize: 36),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

        const SizedBox(height: 40),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: [
                _buildModeCard(
                  context,
                  index: 0,
                  title: 'Offline',
                  subtitle: 'Campaign Mode',
                  description: 'Play against AI with 3 difficulty levels',
                  icon: Icons.psychology_outlined,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D9FF), Color(0xFF0099FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmojiSelectionScreen(),
                      ),
                    );
                  },
                ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2),

                const SizedBox(height: 16),

                _buildModeCard(
                  context,
                  index: 1,
                  title: 'Online',
                  subtitle: 'Multiplayer',
                  description: 'Challenge players from around the world',
                  icon: Icons.public_outlined,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF4B6E), Color(0xFFFF1744)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnlineLoginScreen(),
                      ),
                    );
                  },
                ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2),

                const SizedBox(height: 16),

                _buildModeCard(
                  context,
                  index: 2,
                  title: 'Local 2P',
                  subtitle: 'Pass & Play',
                  description: 'Play with a friend on the same device',
                  icon: Icons.people_outline,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const EmojiSelectionScreen(isLocal2P: true),
                      ),
                    );
                  },
                ).animate().fadeIn(delay: 500.ms).slideX(begin: -0.2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      children: [
        _buildAppBar(context),
        const Spacer(),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Your Battle Mode',
                style: AppTheme.displayLarge.copyWith(fontSize: 56),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDesktopCard(
                    context,
                    index: 0,
                    title: 'Offline',
                    subtitle: 'Campaign Mode',
                    description: 'Play against AI\nwith 3 difficulty levels',
                    icon: Icons.psychology_outlined,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D9FF), Color(0xFF0099FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmojiSelectionScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 32),
                  _buildDesktopCard(
                    context,
                    index: 1,
                    title: 'Online',
                    subtitle: 'Multiplayer',
                    description: 'Challenge players\nfrom around the world',
                    icon: Icons.public_outlined,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF4B6E), Color(0xFFFF1744)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnlineLoginScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 32),
                  _buildDesktopCard(
                    context,
                    index: 2,
                    title: 'Local 2P',
                    subtitle: 'Pass & Play',
                    description: 'Play with a friend\non the same device',
                    icon: Icons.people_outline,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const EmojiSelectionScreen(isLocal2P: true),
                        ),
                      );
                    },
                  ),
                ],
              ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),
            ],
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
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
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildModeCard(
    BuildContext context, {
    required int index,
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required LinearGradient gradient,
    required VoidCallback onTap,
  }) {
    final isHovered = hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = null),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.diagonal3Values(
            isHovered ? 1.02 : 1.0,
            isHovered ? 1.02 : 1.0,
            isHovered ? 1.02 : 1.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: AppTheme.cardDecoration.copyWith(
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : AppTheme.cardShadow,
            ),
            child: Row(
              children: [
                Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: gradient.colors.first.withValues(alpha: 0.4),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(icon, color: Colors.white, size: 30),
                    )
                    .animate()
                    .fadeIn(delay: (300 + index * 100).ms)
                    .scale(delay: (300 + index * 100).ms),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTheme.headingStyle.copyWith(
                          fontSize: 22,
                          color: AppTheme.text,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: AppTheme.captionStyle.copyWith(
                          fontSize: 13,
                          color: gradient.colors.first,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: AppTheme.captionStyle.copyWith(
                          fontSize: 12,
                          color: AppTheme.textSecondary.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(
                    isHovered ? 4.0 : 0.0,
                    0.0,
                    0.0,
                  ),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: gradient.colors.first,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopCard(
    BuildContext context, {
    required int index,
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required LinearGradient gradient,
    required VoidCallback onTap,
  }) {
    final isHovered = hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = null),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 300,
          height: 400,
          curve: Curves.easeOutCubic,
          transform: Matrix4.diagonal3Values(
            isHovered ? 1.05 : 1.0,
            isHovered ? 1.05 : 1.0,
            isHovered ? 1.05 : 1.0,
          ),
          decoration: AppTheme.cardDecoration.copyWith(
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: gradient.colors.first.withValues(alpha: 0.4),
                      blurRadius: 40,
                      offset: const Offset(0, 15),
                    ),
                  ]
                : AppTheme.cardShadow,
            border: isHovered
                ? Border.all(color: gradient.colors.first, width: 2)
                : AppTheme.cardDecoration.border,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: gradient,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: gradient.colors.first.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 48),
              ),
              const SizedBox(height: 32),
              Text(
                title,
                style: AppTheme.headingStyle.copyWith(
                  fontSize: 32,
                  color: AppTheme.text,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: AppTheme.captionStyle.copyWith(
                  fontSize: 16,
                  color: gradient.colors.first,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTheme.captionStyle.copyWith(
                    fontSize: 14,
                    color: AppTheme.textSecondary.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
