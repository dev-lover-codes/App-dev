import 'dart:math';

class AIService {
  static const String human =
      'X'; // Default, will be replaced by logic if needed
  static const String ai = 'O';

  /// Returns the index of the best move
  static int getBestMove(
    List<String> board,
    String difficulty,
    String aiSymbol,
    String humanSymbol,
  ) {
    // Temporarily map symbols to internal logic
    List<String> normalizedBoard = board.map((e) {
      if (e == aiSymbol) return ai;
      if (e == humanSymbol) return human;
      return '';
    }).toList();

    int moveIndex = -1;
    if (difficulty == 'easy') {
      moveIndex = _getEasyMove(normalizedBoard);
    } else if (difficulty == 'normal') {
      moveIndex = _getNormalMove(normalizedBoard);
    } else {
      moveIndex = _getBestMoveMinimax(normalizedBoard, ai);
    }
    return moveIndex;
  }

  static int _getEasyMove(List<String> board) {
    List<int> available = [];
    for (var i = 0; i < board.length; i++) {
      if (board[i] == '') available.add(i);
    }
    if (available.isEmpty) return -1;
    final random = Random();

    // 30% chance to block or win, 70% random
    if (random.nextDouble() < 0.3) {
      for (var index in available) {
        board[index] = ai;
        if (checkWin(board, ai)) {
          board[index] = '';
          return index;
        }
        board[index] = human; // Check if human would win
        if (checkWin(board, human)) {
          board[index] = '';
          return index; // Block
        }
        board[index] = '';
      }
    }
    return available[random.nextInt(available.length)];
  }

  static int _getNormalMove(List<String> board) {
    final random = Random();
    // 60% optimal, 40% random
    if (random.nextDouble() < 0.6) {
      return _getBestMoveMinimax(board, ai);
    } else {
      return _getEasyMove(board);
    }
  }

  static int _getBestMoveMinimax(List<String> board, String player) {
    int bestScore = -1000;
    int move = -1;
    List<int> available = [];
    for (var i = 0; i < board.length; i++) {
      if (board[i] == '') available.add(i);
    }

    if (available.isEmpty) return -1;

    // Optimization: If empty board, pick center or corner
    if (available.length == 9) return 4;
    if (available.length == 8 && board[4] == '') return 4;

    for (var i in available) {
      board[i] = player;
      int score = _minimax(board, 0, false);
      board[i] = '';
      if (score > bestScore) {
        bestScore = score;
        move = i;
      }
    }
    return move;
  }

  static int _minimax(List<String> board, int depth, bool isMaximizing) {
    if (checkWin(board, ai)) return 10 - depth;
    if (checkWin(board, human)) return depth - 10;
    if (!board.contains('')) return 0;

    if (isMaximizing) {
      int bestScore = -1000;
      for (var i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = ai;
          bestScore = max(bestScore, _minimax(board, depth + 1, false));
          board[i] = '';
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (var i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = human;
          bestScore = min(bestScore, _minimax(board, depth + 1, true));
          board[i] = '';
        }
      }
      return bestScore;
    }
  }

  static bool checkWin(List<String> board, String player) {
    const List<List<int>> winningPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var pattern in winningPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }
}
