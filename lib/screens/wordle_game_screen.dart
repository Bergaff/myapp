import 'package:flutter/material.dart';
import '../models/game_logic.dart';
import '../widgets/game_board.dart';
import '../widgets/game_keyboard.dart';
import '../widgets/settings_bar.dart';
import '../utils/dialogs.dart';

class WordleGameScreen extends StatefulWidget {
  const WordleGameScreen({Key? key}) : super(key: key);

  @override
  _WordleGameScreenState createState() => _WordleGameScreenState();
}

class _WordleGameScreenState extends State<WordleGameScreen> {
  late GameLogic gameLogic;

  @override
  void initState() {
    super.initState();
    gameLogic = GameLogic();
    gameLogic.startNewGame();
  }

  void makeGuess() {
    setState(() {
      gameLogic.makeGuess();
      if (gameLogic.gameOver) {
        if (gameLogic.currentGuess == gameLogic.targetGrade) {
          showWinDialog(context, gameLogic);
        } else {
          showLoseDialog(context, gameLogic);
        }
      }
    });
  }

  void onCharacterPressed(String char) {
    if (!gameLogic.gameOver) {
      setState(() {
        gameLogic.onCharacterPressed(char);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SettingsBar(gameLogic: gameLogic),
          Expanded(
            child: GameBoard(gameLogic: gameLogic),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: makeGuess,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(8),
                minimumSize: Size(40, 40),
                backgroundColor: const Color.fromARGB(255, 245, 222, 165),
                side: const BorderSide(color: Colors.deepOrangeAccent, width: 2),
              ),
              child: Text('Подтвердить', style: TextStyle(fontSize: 14, color: Colors.deepOrangeAccent)),
            ),
          ),
          GameKeyboard(onCharacterPressed: onCharacterPressed),
        ],
      ),
    );
  }
}