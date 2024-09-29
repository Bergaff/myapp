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
        if (gameLogic.isWin) {
          showWinDialog(context, gameLogic);
        } else {
          showLoseDialog(context, gameLogic);
        }
      }
    });
  }

  void startNewGame() {
    setState(() {gameLogic.startNewGame();});
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
        verticalDirection: VerticalDirection.down,
        children: [
          SettingsBar(gameLogic: gameLogic),
          Expanded(
            child: GameBoard(gameLogic: gameLogic),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: gameLogic.gameOver?startNewGame:makeGuess,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(8),
                minimumSize: Size(40, 40),
                backgroundColor: const Color.fromARGB(255, 245, 222, 165),
                side:
                    const BorderSide(color: Color(0xFFEC6043), width: 2),
              ),
              child: Text(gameLogic.gameOver ? 'Новая игра' : 'Подтвердить',
                  style:
                      TextStyle( color: Color(0xFFEC6043), fontWeight: FontWeight.bold)),
            ),
          ),
          GameKeyboard(
            onCharacterPressed: onCharacterPressed,
            gameLogic: gameLogic,
          ),
        ],
      ),
    );
  }
}
