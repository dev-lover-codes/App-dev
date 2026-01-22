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
              // Header
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 32,
                    decoration: BoxDecoration(
                      gradient: AppTheme.accentGradient,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('XO', style: AppTheme.titleStyle.copyWith(fontSize: 28)),
                ],
              ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1),

              const Spacer(),

              // Main Title
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ready to',
                        style: AppTheme.displayLarge.copyWith(
                          fontSize: 48,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      Text(
                        'Play?',
                        style: AppTheme.displayLarge.copyWith(fontSize: 48),
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 600.ms)
                  .slideY(begin: 0.1),

              const SizedBox(height: 24),

              // Subtitle
              Text(
                'Choose your game mode and start\nwinning matches',
                style: AppTheme.bodyStyle.copyWith(fontSize: 16),
              ).animate().fadeIn(delay: 400.ms),

              const SizedBox(height: 48),

              // Game preview card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: AppTheme.cardDecoration.copyWith(
                  boxShadow: AppTheme.cardShadow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Mini game board
                    Container(
                      width: 120,
                      height: 120,
                      child: CustomPaint(painter: MiniGameBoardPainter()),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 600.ms).scale(delay: 600.ms),

              const Spacer(),

              // Stats row
              Container(
                padding: const EdgeInsets.all(20),
                decoration: AppTheme.cardDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStat('Games', '0'),
                    Container(width: 1, height: 40, color: AppTheme.border),
                    _buildStat('Wins', '0'),
                    Container(width: 1, height: 40, color: AppTheme.border),
                    _buildStat('Streak', '0'),
                  ],
                ),
              ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.1),

              const SizedBox(height: 24),

              // Start button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ModeSelectionScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppTheme.accentGradient,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Start Playing',
                      style: AppTheme.buttonTextStyle.copyWith(fontSize: 17),
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.2),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: AppTheme.headingStyle.copyWith(fontSize: 24)),
        const SizedBox(height: 4),
        Text(label, style: AppTheme.captionStyle),
      ],
    );
  }
}

class MiniGameBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.border
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final cellSize = size.width / 3;

    // Draw grid
    for (int i = 1; i < 3; i++) {
      // Vertical lines
      canvas.drawLine(
        Offset(cellSize * i, 0),
        Offset(cellSize * i, size.height),
        paint,
      );
      // Horizontal lines
      canvas.drawLine(
        Offset(0, cellSize * i),
        Offset(size.width, cellSize * i),
        paint,
      );
    }

    // Draw X (cyan)
    final xPaint = Paint()
      ..color = AppTheme.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final padding = cellSize * 0.3;
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

    // Draw O (pink)
    final oPaint = Paint()
      ..color = AppTheme.secondary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(cellSize * 1.5, cellSize * 1.5),
      cellSize * 0.2,
      oPaint,
    );

    // Draw X in bottom right
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
