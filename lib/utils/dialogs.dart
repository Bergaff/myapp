import 'package:flutter/material.dart';
import '../models/game_logic.dart';

void showRulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Правила игры'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Цель игры - угадать марку стали ГОСТ за 6 попыток.'),
                Text('2. После каждой попытки цвет букв изменится:'),
                Text('   - Зелёный: буква на правильной позиции'),
                Text('   - Жёлтый: буква есть в марке, но не на этой позиции'),
                Text('   - Серый: такой буквы в марке нет'),
                Text('3. Марка стали может содержать буквы и цифры.'),
                Text('4. Используйте клавиатуру на экране для ввода.'),
                Text('5. Нажмите "Подтвердить" после ввода каждой попытки.'),
                Text('6. Удачи!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Закрыть'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }


  void showStatisticsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Статистика'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Игр сыграно: $gamesPlayed'),
              Text('Игр выиграно: $gamesWon'),
              Text(
                  'Процент побед: ${gamesPlayed > 0 ? (gamesWon / gamesPlayed * 100).toStringAsFixed(1) : 0}%'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Закрыть'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Настройки'),
          content: const Text('Здесь будут настройки игры'),
          actions: <Widget>[
            TextButton(
              child: const Text('Закрыть'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

void showWinDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Поздравляем!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Вы угадали марку стали: $targetGrade'),
              const SizedBox(height: 10),
              const Text('Описание:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(steelGrades[targetGrade]!),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Новая игра'),
              onPressed: () {
                Navigator.of(context).pop();
                startNewGame();
              },
            ),
          ],
        );
      },
    );
  }

  void showLoseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Игра окончена'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Загаданная марка стали: $targetGrade'),
              const SizedBox(height: 10),
              const Text('Описание:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(steelGrades[targetGrade]!),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Новая игра'),
              onPressed: () {
                Navigator.of(context).pop();
                startNewGame();
              },
            ),
          ],
        );
      },
    );
  }
