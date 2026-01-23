import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import 'mode_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand Logo
              Row(
                    children: [
                      Container(
                        width: 4,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: AppTheme.accentGradient,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'XO',
                            style: AppTheme.titleStyle.copyWith(
                              fontSize: 32,
                              height: 1,
                            ),
                          ),
                          Text(
                            'NEON',
                            style: AppTheme.captionStyle.copyWith(
                              fontSize: 10,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                  .slideX(begin: -0.2, curve: Curves.easeOutCubic),

              const Spacer(),

              // Main Hero Text
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ready to',
                        style: AppTheme.displayLarge.copyWith(
                          fontSize: 52,
                          height: 1.1,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppTheme.accentGradient.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        child: Text(
                          'Dominate?',
                          style: AppTheme.displayLarge.copyWith(
                            fontSize: 52,
                            height: 1.1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 800.ms)
                  .slideY(begin: 0.15, curve: Curves.easeOutCubic),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                    'Strategic, competitive, and addictive.\nTest your skills against AI or real players.',
                    style: AppTheme.bodyStyle.copyWith(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 600.ms)
                  .slideY(begin: 0.1),

              const SizedBox(height: 60),

              // Feature highlights
              Row(
                children: [
                  _buildFeature('AI Powered', Icons.psychology_outlined),
                  const SizedBox(width: 24),
                  _buildFeature('Multiplayer', Icons.public_outlined),
                  const SizedBox(width: 24),
                  _buildFeature('Competitive', Icons.emoji_events_outlined),
                ],
              ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.1),

              const Spacer(),

              // Game preview card
              Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppTheme.cardBackground,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppTheme.border),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: CustomPaint(
                            painter: EnhancedGameBoardPainter(),
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 900.ms, duration: 800.ms)
                  .scale(delay: 900.ms, begin: const Offset(0.9, 0.9))
                  .shimmer(
                    delay: 2000.ms,
                    duration: 2000.ms,
                    color: AppTheme.primary.withOpacity(0.1),
                  ),

              const Spacer(),

              // Start button
              GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const ModeSelectionScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.easeOutCubic;
                                var tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                          transitionDuration: const Duration(milliseconds: 400),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(
                        gradient: AppTheme.accentGradient,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start Playing',
                              style: AppTheme.buttonTextStyle.copyWith(
                                fontSize: 18,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 1100.ms, duration: 600.ms)
                  .slideY(begin: 0.2, curve: Curves.easeOutCubic)
                  .shimmer(
                    delay: 2500.ms,
                    duration: 1500.ms,
                    color: Colors.white.withOpacity(0.3),
                  ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(String label, IconData icon) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.border),
          ),
          child: Icon(icon, color: AppTheme.primary, size: 16),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppTheme.captionStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class EnhancedGameBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.border
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final cellSize = size.width / 3;

    // Draw grid with rounded corners
    for (int i = 1; i < 3; i++) {
      // Vertical lines
      canvas.drawLine(
        Offset(cellSize * i, 10),
        Offset(cellSize * i, size.height - 10),
        paint,
      );
      // Horizontal lines
      canvas.drawLine(
        Offset(10, cellSize * i),
        Offset(size.width - 10, cellSize * i),
        paint,
      );
    }

    // Draw X (cyan with gradient effect)
    final xPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF00D9FF), Color(0xFF0099FF)],
      ).createShader(Rect.fromLTWH(0, 0, cellSize, cellSize))
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final padding = cellSize * 0.28;
    // X in top-left
    canvas.drawLine(
      Offset(padding, padding),
      Offset(cellSize - padding, cellSize - padding),
      xPaint,
    );
    canvas.drawLine(
      Offset(cellSize - padding, padding),
      Offset(padding, cellSize - padding),
      xPaint,
    );

    // Draw O (pink/red with gradient effect)
    final oPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFF4B6E), Color(0xFFFF1744)],
      ).createShader(Rect.fromLTWH(cellSize, cellSize, cellSize, cellSize))
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(cellSize * 1.5, cellSize * 1.5),
      cellSize * 0.22,
      oPaint,
    );

    // X in bottom-right
    canvas.drawLine(
      Offset(cellSize * 2 + padding, cellSize * 2 + padding),
      Offset(cellSize * 3 - padding, cellSize * 3 - padding),
      xPaint,
    );
    canvas.drawLine(
      Offset(cellSize * 3 - padding, cellSize * 2 + padding),
      Offset(cellSize * 2 + padding, cellSize * 3 - padding),
      xPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
