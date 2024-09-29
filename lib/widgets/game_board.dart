import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/game_logic.dart';

class GameBoard extends StatelessWidget {
  final GameLogic gameLogic;

  const GameBoard({Key? key, required this.gameLogic}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Выравнивание по левому краю
    children: [
      Container(
        width: max(gameLogic.targetGrade.length*51,140),
        margin: const EdgeInsets.all(14),
        child: Text(
          gameLogic.titleText,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFFEC6043)//Color(0xFFEC6043)
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
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
        ),
      ),
    ],
  );
}
  Widget buildGuessRow(List<String> guess) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(gameLogic.targetGrade.length, (index) {
        return buildCharacterBox(guess[index], index, guess,true);
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
          false,
        );
      }),
    );
  }

  Widget buildEmptyRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(gameLogic.targetGrade.length, (index) {
        return buildCharacterBox('', index, [], false);
      }),
    );
  }

  Widget buildCharacterBox(String char, int index, List<String> guess,bool isGuess) {
    return Container(
      width: 50,
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: const BorderSide(color: Color(0xFFEC6043), width: 2),
          top: const BorderSide(color: Color(0xFFEC6043), width: 2),
          left: BorderSide(color: Color(0xFFEC6043), width: (index == 0) ? 2 : 0.5),
          right: BorderSide(color: Color(0xFFEC6043), width: (index == gameLogic.targetGrade.length - 1) ? 2 : 0.5),
        ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular((index == 0) ? 20 : 0),
                  right: Radius.circular(
                      (index == gameLogic.targetGrade.length - 1) ? 20 : 0),
                ),
      ),
      child: Center(
        child: Text(
          char,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _getColorFromString(gameLogic.getCharColor(char, index, guess,isGuess)),
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
        return Color.fromARGB(255, 223, 113, 2);
      case 'grey':
        return const Color(0x83000096);
      default:
        return Color(0xFFEC6043);
    }
  }
}