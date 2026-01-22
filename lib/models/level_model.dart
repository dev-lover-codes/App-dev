class Level {
  final int id;
  final String name;
  final String description;
  final int totalStages;
  final String difficulty; // 'easy', 'normal', 'impossible'
  final bool isLocked;

  Level({
    required this.id,
    required this.name,
    required this.description,
    required this.totalStages,
    required this.difficulty,
    this.isLocked = true,
  });
}

class Stage {
  final int id;
  final int levelId;
  final int stageNumber;
  final bool isLocked;
  final int stars; // 0, 1, 2, 3

  Stage({
    required this.id,
    required this.levelId,
    required this.stageNumber,
    this.isLocked = true,
    this.stars = 0,
  });

  Stage copyWith({bool? isLocked, int? stars}) {
    return Stage(
      id: id,
      levelId: levelId,
      stageNumber: stageNumber,
      isLocked: isLocked ?? this.isLocked,
      stars: stars ?? this.stars,
    );
  }
}
