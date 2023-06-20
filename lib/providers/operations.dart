import 'package:flutter/material.dart';

class OperationProvider extends ChangeNotifier {
  double number_1 = 0;
  double number_2 = 0;
  double total = 0;

  String operation = "";
  String operators = "";
  String lastCharacter = "";

  void clearOperation() {
    operation = "";
    lastCharacter = "";
    total = 0;

    notifyListeners();
    return;
  }

  void changeToPercentage() {
    total = (total / 100);
    operation = total.toString();
    notifyListeners();
  }

  void changeSymbol() {
    total *= -1;
    operation = total.toString();
    notifyListeners();
  }

  void writeOperation(character) {
    if (character == "C") {
      clearOperation();
    } else if (character == "%") {
      changeToPercentage();
    } else if (character == "+/-") {
      changeSymbol();
    } else {
      // Validate operator isn't together
      if (!["C", "+/-", "%", "/", "x", "-", "+", "."].contains(lastCharacter)) {
        // Delete Characters
        if (character == "←") {
          List<String> letters = operation.split("");
          if (letters.isNotEmpty) {
            lastCharacter = letters.removeLast();
            if (["x", "/", "+", "-", " "].contains(lastCharacter)) {
              lastCharacter = letters.removeLast();
            }
          }
          operation = letters.join();
        } else {
          // Write
          if (["C", "+/-", "%", "/", "x", "+", "-"].contains(character)) {
            operation += " $character ";
          } else if (lastCharacter != ".") {
            operation += character;
          }
        }
      }
    }
    lastCharacter = character;
    notifyListeners();
  }

  void operateCharacter() {
    List<dynamic> numbers = operation.split(" ");
    List<String> operators = ["x", "/", "-", "+"];

    if (numbers.contains("")) {
      numbers = ["0"];
    }

    if (!["x", "/", "-", "+"].contains(lastCharacter)) {
      // Reducing the results
      while (numbers.length > 1) {
        for (var m = 0; m < operators.length; m++) {
          // Searching numbers at List
          for (var i = 0; i < numbers.length; i++) {
            // Searching operation characters
            if (numbers[i] == operators[m]) {
              double result = operateNumbers([numbers[i - 1], numbers[i], numbers[i + 1]]);
              numbers[i - 1] = "";
              numbers[i] = result.toString();
              numbers[i + 1] = "";
              numbers = numbers.where((element) => element != "").toList();
              break;
            }
          }
        }
      }
      total = double.parse(numbers[0]);
      operation = numbers[0];
      notifyListeners();
    }
  }

  double operateNumbers(List numbersList) {
    double result = 0;
    double temp_1 = double.parse(numbersList[0]);
    double temp_2 = double.parse(numbersList[2]);

    switch (numbersList[1]) {
      case "x":
        result = temp_1 * temp_2;
        break;
      case "/":
        result = temp_1 / temp_2;
        break;
      case "-":
        result = temp_1 - temp_2;
        break;
      default:
        result = temp_1 + temp_2;
        break;
    }
    notifyListeners();
    return result;
  }
}
