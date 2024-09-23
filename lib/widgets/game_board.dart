import 'package:flutter/material.dart';
import '../models/game_logic.dart';

class GameBoard extends StatelessWidget {
  final GameLogic gameLogic;

  const GameBoard({Key? key, required this.gameLogic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameLogic.maxAttempts,
      itemBuilder: (context, attemptIndex) {
        if (attemptIndex < gameLogic.guesses.length) {
          return buildGuessRow(gameLogic.guesses[attemptIndex]);
        } else if (attemptIndex == gameLogic.guesses.length && !gameLogic.gameOver) {
          return buildCurrentGuessRow();
        } else {
          return buildEmptyRow();
        }
      },
    );
  }

  Widget buildGuessRow(String guess) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(gameLogic.targetGrade.length, (index) {
        return buildCharacterBox(guess[index], index, guess);
      }),
    );
  }

  Widget buildCurrentGuessRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(gameLogic.targetGrade.length, (index) {
        return buildCharacterBox(
          index < gameLogic.currentGuess.length ? gameLogic.currentGuess[index] : '',
          index,
          gameLogic.currentGuess,
        );
      }),
    );
  }

  Widget buildEmptyRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(gameLogic.targetGrade.length, (index) {
        return buildCharacterBox('', index, '');
      }),
    );
  }

  Widget buildCharacterBox(String char, int index, String guess) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: const BorderSide(color: Colors.deepOrangeAccent, width: 2),
          top: const BorderSide(color: Colors.deepOrangeAccent, width: 2),
          left: BorderSide(color: Colors.deepOrangeAccent, width: (index == 0) ? 2 : 0.5),
          right: BorderSide(color: Colors.deepOrangeAccent, width: (index == gameLogic.targetGrade.length - 1) ? 2 : 0.5),
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular((index == 0) ? 20 : 0),
          right: Radius.circular((index == gameLogic.targetGrade.length - 1) ? 20 : 0),
        ),
      ),
      child: Center(
        child: Text(
          char,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _getColorFromString(gameLogic.getCharColor(char, index, guess)),
          ),
        ),
      ),
    );
  }

  Color _getColorFromString(String colorString) {
    switch (colorString) {
      case 'green':
        return const Color.fromARGB(255, 67, 122, 53);
      case 'yellow':
        return const Color.fromARGB(255, 223, 113, 2);
      case 'grey':
      default:
        return const Color(0x83000096);
    }
  }
}