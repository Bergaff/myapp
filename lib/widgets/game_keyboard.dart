import 'package:flutter/material.dart';

class GameKeyboard extends StatelessWidget {
  final Function(String) onCharacterPressed;

  const GameKeyboard({Key? key, required this.onCharacterPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: 'АВГДЗКМНОПРСТУФХЦШЮ0123456789<'.split('').map((char) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                onPressed: () => onCharacterPressed(char),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  minimumSize: Size(40, 40),
                  backgroundColor: const Color.fromARGB(255, 245, 222, 165),
                  side: const BorderSide(color: Colors.deepOrangeAccent, width: 2),
                ),
                child: Text(char, style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}