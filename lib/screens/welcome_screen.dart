import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          child: Stack(
            children: [
              // Animated background particles
              ...List.generate(
                20,
                (index) => Positioned(
                  top: (index * 50.0) % MediaQuery.of(context).size.height,
                  left: (index * 60.0) % MediaQuery.of(context).size.width,
                  child:
                      Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          )
                          .animate(onPlay: (c) => c.repeat(reverse: true))
                          .fadeIn(duration: (2000 + index * 100).ms)
                          .fadeOut(delay: (2000 + index * 100).ms),
                ),
              ),

              // Main content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // App Icon/Logo
                  Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primary.withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/icons/app_icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .scale(
                        delay: 200.ms,
                        duration: 600.ms,
                        curve: Curves.elasticOut,
                      ),

                  const SizedBox(height: 40),

                  // Title with neon effect
                  Stack(
                        children: [
                          // Glow effect
                          Text(
                            "XO NEON",
                            style: AppTheme.titleStyle.copyWith(
                              fontSize: 56,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 8
                                ..color = AppTheme.secondary.withOpacity(0.5)
                                ..maskFilter = const MaskFilter.blur(
                                  BlurStyle.outer,
                                  10,
                                ),
                            ),
                          ),
                          // Main text
                          Text(
                            "XO NEON",
                            style: AppTheme.titleStyle.copyWith(
                              fontSize: 56,
                              foreground: Paint()
                                ..shader =
                                    const LinearGradient(
                                      colors: [Colors.white, Color(0xFF06B6D4)],
                                    ).createShader(
                                      const Rect.fromLTWH(0, 0, 300, 70),
                                    ),
                            ),
                          ),
                        ],
                      )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: -0.2, end: 0)
                      .then()
                      .shimmer(
                        delay: 1000.ms,
                        duration: 2000.ms,
                        color: Colors.white.withOpacity(0.3),
                      ),

                  const SizedBox(height: 15),

                  // Subtitle
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "✨ The Ultimate Tic Tac Toe Experience",
                      style: AppTheme.headingStyle.copyWith(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ).animate().fadeIn(delay: 400.ms).scale(delay: 400.ms),

                  const Spacer(),

                  // Animated game grid preview
                  Container(
                        width: 140,
                        height: 140,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 2,
                          ),
                        ),
                        child: CustomPaint(painter: TicTacToeBoardPainter()),
                      )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        duration: 3000.ms,
                        color: AppTheme.secondary.withOpacity(0.3),
                      )
                      .rotate(begin: 0, end: 0.02, duration: 2000.ms)
                      .then()
                      .rotate(begin: 0.02, end: -0.02, duration: 2000.ms),

                  const Spacer(),

                  // Play Button with enhanced design
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
                                height: 65,
                                decoration: BoxDecoration(
                                  gradient: AppTheme.secondaryGradient,
                                  borderRadius: BorderRadius.circular(35),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.secondary.withOpacity(
                                        0.5,
                                      ),
                                      blurRadius: 25,
                                      offset: const Offset(0, 8),
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: const Offset(0, -2),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    // Shine effect
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(35),
                                            topRight: Radius.circular(35),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.white.withOpacity(0.3),
                                              Colors.white.withOpacity(0),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Button content
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            "START PLAYING",
                                            style: AppTheme.buttonTextStyle
                                                .copyWith(
                                                  fontSize: 20,
                                                  letterSpacing: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .animate()
                              .scale(
                                delay: 600.ms,
                                duration: 500.ms,
                                curve: Curves.elasticOut,
                              )
                              .shimmer(delay: 2000.ms, duration: 1500.ms),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Version info
                  Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 12,
                    ),
                  ).animate().fadeIn(delay: 800.ms),

                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom painter for the tic-tac-toe board preview
class TicTacToeBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw grid
    final cellSize = size.width / 3;

    // Vertical lines
    canvas.drawLine(Offset(cellSize, 0), Offset(cellSize, size.height), paint);
    canvas.drawLine(
      Offset(cellSize * 2, 0),
      Offset(cellSize * 2, size.height),
      paint,
    );

    // Horizontal lines
    canvas.drawLine(Offset(0, cellSize), Offset(size.width, cellSize), paint);
    canvas.drawLine(
      Offset(0, cellSize * 2),
      Offset(size.width, cellSize * 2),
      paint,
    );

    // Draw X in top-left
    final xPaint = Paint()
      ..color = const Color(0xFF06B6D4)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final padding = cellSize * 0.25;
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

    // Draw O in center
    final oPaint = Paint()
      ..color = const Color(0xFFEC4899)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(cellSize * 1.5, cellSize * 1.5),
      cellSize * 0.25,
      oPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
