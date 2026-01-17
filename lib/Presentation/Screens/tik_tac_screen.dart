import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled2/AppUtils/app_colors.dart';

/// ---------------- STRINGS ----------------
class AppStrings {
  static const playerX = "Player X";
  static const playerO = "Player O";
  static const playAgain = "Play Again";
  static const reset = "Reset Game";
  static const draw = "It's a Draw 🤝";
}

/// ---------------- SCREEN ----------------
class TicTacScreen extends StatefulWidget {
  const TicTacScreen({super.key});

  @override
  State<TicTacScreen> createState() => _TicTacScreenState();
}

class _TicTacScreenState extends State<TicTacScreen> {
  bool oTurn = true;
  List<String> board = List.filled(9, '');
  int xScore = 0;
  int oScore = 0;
  int filledBoxes = 0;
  List<int> winIndexes = [];

  /// TAP
  void _tap(int index) {
    if (board[index].isNotEmpty || winIndexes.isNotEmpty) return;

    setState(() {
      board[index] = oTurn ? 'O' : 'X';
      oTurn = !oTurn;
      filledBoxes++;
    });

    _checkWinner();
  }

  /// CHECK WINNER
  void _checkWinner() {
    const patterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var p in patterns) {
      if (board[p[0]] != '' &&
          board[p[0]] == board[p[1]] &&
          board[p[0]] == board[p[2]]) {
        setState(() {
          winIndexes = List<int>.from(p);
          board[p[0]] == 'O' ? oScore++ : xScore++;
        });

        _showResult("${board[p[0]]} Wins 🎉");
        return;
      }
    }

    if (filledBoxes == 9 && winIndexes.isEmpty) {
      _showResult(AppStrings.draw);
    }
  }

  /// RESULT DIALOG
  void _showResult(String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetBoard();
            },
            child: Text(
              AppStrings.playAgain,
              style: TextStyle(color: AppColors.accent),
            ),
          ),
        ],
      ),
    );
  }

  /// RESET BOARD
  void _resetBoard() {
    setState(() {
      board = List.filled(9, '');
      filledBoxes = 0;
      winIndexes = [];
      oTurn = true;
    });
  }

  /// RESET GAME
  void _resetGame() {
    setState(() {
      xScore = 0;
      oScore = 0;
    });
    _resetBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.darkGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),

              /// TURN INDICATOR
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  oTurn ? "O's Turn" : "X's Turn",
                  key: ValueKey(oTurn),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:
                    oTurn ? AppColors.playerO : AppColors.playerX,
                    shadows: [
                      Shadow(
                        blurRadius: 12,
                        color:
                        oTurn ? AppColors.playerO : AppColors.playerX,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// SCORE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _scoreCard(AppStrings.playerX, xScore, AppColors.playerX),
                  _scoreCard(AppStrings.playerO, oScore, AppColors.playerO),
                ],
              ),

              const SizedBox(height: 30),

              /// GRID
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                    ),
                    itemBuilder: (_, index) {
                      final isWin = winIndexes.contains(index);
                      final symbol = board[index];

                      return GestureDetector(
                        onTap: () => _tap(index),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: BackdropFilter(
                            filter:
                            ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: isWin
                                    ? [
                                  BoxShadow(
                                    color: AppColors.success,
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ]
                                    : [],
                                border: Border.all(
                                  color: isWin
                                      ? AppColors.success
                                      : AppColors.white.withOpacity(0.18),
                                  width: isWin ? 2.5 : 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  symbol,
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: symbol == 'X'
                                        ? AppColors.playerX
                                        : AppColors.playerO,
                                    shadows: symbol.isNotEmpty
                                        ? [
                                      Shadow(
                                        blurRadius: 14,
                                        color: symbol == 'X'
                                            ? AppColors.playerX
                                            : AppColors.playerO,
                                      ),
                                    ]
                                        : [],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              /// RESET BUTTON
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ElevatedButton(
                  onPressed: _resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    elevation: 10,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 46, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    AppStrings.reset,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// SCORE CARD
  Widget _scoreCard(String title, int score, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 150,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.white.withOpacity(0.18),
            ),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$score",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                  shadows: [
                    Shadow(
                      blurRadius: 12,
                      color: color,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
