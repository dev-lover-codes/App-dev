import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import '../providers/game_provider.dart';
import '../models/level_model.dart';
import 'stages_screen.dart';

class OfflineLevelsScreen extends StatelessWidget {
  const OfflineLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text("Select Level", style: AppTheme.headingStyle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<GameProvider>(
        builder: (context, game, child) {
          if (game.levels.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: game.levels.length,
            itemBuilder: (context, index) {
              final level = game.levels[index];
              return _buildLevelCard(context, level, index).animate().slideY(
                begin: 0.2,
                end: 0,
                delay: Duration(milliseconds: index * 100),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLevelCard(BuildContext context, Level level, int index) {
    bool isLocked = level.isLocked;

    return GestureDetector(
      onTap: isLocked
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StagesScreen(levelId: level.id),
                ),
              );
            },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 120,
        decoration: BoxDecoration(
          color: isLocked
              ? AppTheme.surface.withOpacity(0.5)
              : AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: isLocked
              ? Border.all(color: Colors.white10)
              : Border.all(color: AppTheme.primary, width: 2),
          boxShadow: isLocked
              ? []
              : [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                color: isLocked
                    ? Colors.white10
                    : AppTheme.primary.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Center(
                child: isLocked
                    ? const Icon(Icons.lock, size: 40, color: Colors.white24)
                    : Text(
                        "${index + 1}",
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                        ),
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      level.name,
                      style: AppTheme.headingStyle.copyWith(
                        color: isLocked ? Colors.white38 : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      level.description,
                      style: AppTheme.bodyStyle.copyWith(
                        fontSize: 14,
                        color: isLocked ? Colors.white24 : Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${level.totalStages} Stages",
                      style: TextStyle(fontSize: 12, color: AppTheme.accent),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
