import 'package:flutter/material.dart';
import 'package:myapp/models/game_logic.dart';

class GameKeyboard extends StatelessWidget {
  final GameLogic gameLogic;
  final Function(String) onCharacterPressed;

  const GameKeyboard(
      {Key? key, required this.onCharacterPressed, required this.gameLogic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            childAspectRatio: 1,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemCount: 32,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final char = index < gameLogic.elChars.length
                ? gameLogic.elChars[index]
                : '';

            return GestureDetector(
              onTap: () {
                 onCharacterPressed(char);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFEC6043),
                      width: (index > 23) ? 2 : 0.1,
                    ),
                    top: BorderSide(
                      color: Color(0xFFEC6043),
                      width: (index < 8) ? 2 : 1,
                    ),
                    left: BorderSide(
                      color: Color(0xFFEC6043),
                      width: (index % 8 == 0) ? 2 : 0.1,
                    ),
                    right: BorderSide(
                      color: Color(0xFFEC6043),
                      width: ((index + 1) % 8 == 0) ? 2 : 1,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular((index == 0) ? 20 : 0),
                    topRight: Radius.circular((index == 7) ? 20 : 0),
                    bottomLeft: Radius.circular((index == 24) ? 20 : 0),
                    bottomRight: Radius.circular((index == 31) ? 20 : 0),
                  ),
                ),
                child: Center(
                  child: Text(
                    char,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          _getColorFromString(gameLogic.knownChars[char] ?? ''),
                    ),
                  ),
                ),
              ),
            );
          },
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
