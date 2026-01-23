import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import '../providers/game_provider.dart';
import 'offline_levels_screen.dart';
import 'game_screen.dart';

class EmojiSelectionScreen extends StatefulWidget {
  final bool isLocal2P;

  const EmojiSelectionScreen({super.key, this.isLocal2P = false});

  @override
  State<EmojiSelectionScreen> createState() => _EmojiSelectionScreenState();
}

class _EmojiSelectionScreenState extends State<EmojiSelectionScreen> {
  final List<String> emojis = ['😎', '🚀', '🔥', '⭐', '⚡', '🐱', '💀', '👽'];
  String selectedEmoji = '😎';
  String player2Emoji = '🤖';
  bool selectingPlayer2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Choose Avatar',
                    style: AppTheme.headingStyle.copyWith(fontSize: 18),
                  ),
                  const Spacer(),
                  const SizedBox(width: 44),
                ],
              ),
            ).animate().fadeIn(duration: 300.ms),

            const SizedBox(height: 20),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isLocal2P
                        ? (selectingPlayer2 ? 'Player 2' : 'Player 1')
                        : 'Select Your',
                    style: AppTheme.displayLarge.copyWith(
                      fontSize: 36,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    'Fighter',
                    style: AppTheme.displayLarge.copyWith(fontSize: 36),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

            const SizedBox(height: 40),

            // Emoji Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: emojis.length,
                itemBuilder: (context, index) {
                  final emoji = emojis[index];
                  final isSelected = selectedEmoji == emoji;
                  return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedEmoji = emoji;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.cardBackground
                                : AppTheme.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primary
                                  : AppTheme.border,
                              width: isSelected ? 2 : 1,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppTheme.primary.withOpacity(0.3),
                                      blurRadius: 16,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              emoji,
                              style: TextStyle(fontSize: isSelected ? 52 : 48),
                            ),
                          ),
                        ),
                      )
                      .animate(key: ValueKey('$emoji-$isSelected'))
                      .fadeIn(delay: (index * 50).ms);
                },
              ),
            ),

            // Selected preview and button
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                border: const Border(top: BorderSide(color: AppTheme.border)),
              ),
              child: Column(
                children: [
                  // Selected preview
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              selectedEmoji,
                              style: const TextStyle(fontSize: 36),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selected Fighter',
                              style: AppTheme.captionStyle,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Ready to Play',
                              style: AppTheme.headingStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Confirm button
                  GestureDetector(
                    onTap: () {
                      final provider = Provider.of<GameProvider>(
                        context,
                        listen: false,
                      );

                      if (widget.isLocal2P && !selectingPlayer2) {
                        // First selection for player 1, now select player 2
                        setState(() {
                          player2Emoji = selectedEmoji == '😎' ? '🚀' : '😎';
                          selectingPlayer2 = true;
                        });
                      } else if (widget.isLocal2P && selectingPlayer2) {
                        // Second selection done, start game
                        provider.setEmojis(selectedEmoji, player2Emoji);
                        provider.setGameMode('local2p');
                        provider.resetGame();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GameScreen(),
                          ),
                        );
                      } else {
                        // Normal AI mode
                        provider.setEmojis(selectedEmoji, '🤖');
                        provider.setGameMode('ai');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OfflineLevelsScreen(),
                          ),
                        );
                      }
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
                          widget.isLocal2P
                              ? (selectingPlayer2
                                    ? 'Start Game'
                                    : 'Select Player 2')
                              : 'Continue',
                          style: AppTheme.buttonTextStyle,
                        ),
                      ),
                    ),
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
