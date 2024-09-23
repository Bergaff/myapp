import 'dart:math';

class GameLogic {
  final Map<String, String> steelGrades = {
    "У7": "инструмент, который работает в условиях, не вызывающих разогрева рабочей кромки: зубила, долота, бородки, молотки, лезвия ножниц для резки металла, топоры, колуны, стамески, плоскогубцы комбинированные, кувалды.",
    "У8Г": "для производства пружинной ленты",
    "05Х12Н6Д2МФСГТ": "для инструмента формообразующих деталей пресс-форм формования резинотехнических и пластмассовых изделий",
    "13Х": "для бритвенных ножей и лезвий, острого хирургического инструмента, шаберов, гравировального инструмента",
    "5ХВ2СФ": "ножи для холодной резки металла, резьбонакатные плашки, пуансоны и обжимные матрицы при холодной работе;деревообделочные инструменты при длительной работе",
  };

  late String targetGrade;
  List<String> guesses = [];
  String currentGuess = '';
  int maxAttempts = 6;
  bool gameOver = false;
  int gamesPlayed = 0;
  int gamesWon = 0;

  void startNewGame() {
    targetGrade = steelGrades.keys.elementAt(Random().nextInt(steelGrades.length));
    guesses = [];
    currentGuess = '';
    gameOver = false;
  }

  void makeGuess() {
    if (currentGuess.length != targetGrade.length) return;

    guesses.add(currentGuess);
    if (currentGuess == targetGrade) {
      gameOver = true;
      gamesWon++;
      gamesPlayed++;
    } else if (guesses.length >= maxAttempts) {
      gameOver = true;
      gamesPlayed++;
    }
    currentGuess = '';
  }

  void onCharacterPressed(String char) {
    if (char == '<' && currentGuess.isNotEmpty) {
      currentGuess = currentGuess.substring(0, currentGuess.length - 1);
    } else if (char != '<' && currentGuess.length < targetGrade.length) {
      currentGuess += char;
    }
  }

  String getCharColor(String char, int index, String guess) {
    if (char == targetGrade[index]) {
      return 'green';
    } else if (targetGrade.contains(char)) {
      return 'yellow';
    }
    return 'grey';
  }
}
