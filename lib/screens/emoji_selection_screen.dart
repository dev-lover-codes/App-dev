import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import '../providers/game_provider.dart';
import 'offline_levels_screen.dart';

class EmojiSelectionScreen extends StatefulWidget {
  const EmojiSelectionScreen({super.key});

  @override
  State<EmojiSelectionScreen> createState() => _EmojiSelectionScreenState();
}

class _EmojiSelectionScreenState extends State<EmojiSelectionScreen> {
  final List<String> emojis = ['😎', '🚀', '🔥', '⭐', '⚡', '🐱', '💀', '👽'];
  String selectedEmoji = '😎';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text("Choose Avatar", style: AppTheme.headingStyle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Select your fighter!",
            style: AppTheme.bodyStyle,
          ).animate().fadeIn(),
          const SizedBox(height: 40),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
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
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.primary.withOpacity(0.2)
                          : AppTheme.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(emoji, style: const TextStyle(fontSize: 48))
                          .animate(target: isSelected ? 1 : 0)
                          .scale(
                            begin: const Offset(1, 1),
                            end: const Offset(1.2, 1.2),
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<GameProvider>(
                    context,
                    listen: false,
                  ).setEmojis(selectedEmoji, '🤖');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OfflineLevelsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text("CONFIRM", style: AppTheme.buttonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
