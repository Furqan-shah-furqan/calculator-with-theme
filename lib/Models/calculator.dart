import 'package:flutter/widgets.dart';

class Calculator with ChangeNotifier {
  List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];



  // USER QUESTION & USER ANSWER.
  String userQuestion = "";
  String userAnswer = "";

  // normal
  buttonTap(int index){
    userQuestion += buttons[index];
    notifyListeners();
  }

  // C tap
  cTap() {
    userQuestion = '';
    userAnswer = '';
    notifyListeners();
  }

  // Del Tap
  delTap() {
    if (userQuestion.isNotEmpty) {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    }
    notifyListeners();
  }

  addition() {
    if (userQuestion.contains('+')) {
      List<String> parts = userQuestion.split('+');
      if (parts.length == 2) {
        double num1 = double.parse(parts[0].trim());
        double num2 = double.parse(parts[1].trim());
        userAnswer = (num1 + num2).toString();
        notifyListeners();
      }
    }
  }

  // when equal is pressed for 'Minus -'
  eMinus() {
    if (userQuestion.contains('-')) {
      List<String> parts = userQuestion.split('-');
      if (parts.length == 2) {
        double num1 = double.parse(parts[0].trim());
        double num2 = double.parse(parts[1].trim());
        userAnswer = (num1 - num2).toString();
        notifyListeners();
      }
    }
  }

  // when equal is pressed for 'Multiply'
  void eMulti() {
    if (userQuestion.contains('x')) {
      List<String> parts = userQuestion.split('x');
      if (parts.length == 2) {
        double num1 = double.parse(parts[0].trim());
        double num2 = double.parse(parts[1].trim());
        userAnswer = (num1 * num2).toString();
        notifyListeners();
      }
    }
  }

  // when equal is pressed for 'Divide /'
  void eDivide() {
    if (userQuestion.contains('/')) {
      List<String> parts = userQuestion.split('/');
      if (parts.length == 2) {
        double num1 = double.parse(parts[0].trim());
        double num2 = double.parse(parts[1].trim());
        userAnswer = (num1 / num2).toString();
        notifyListeners();
      }
    }
  }

  // when equal is pressed for 'Percentage %'
  void ePercent() {
    if (userQuestion.contains('%')) {
      List<String> parts = userQuestion.split('%');
      if (parts.length == 2) {
        double num1 = double.parse(parts[0].trim());
        double num2 = double.parse(parts[1].trim());
        userAnswer = (num1 * num2 / 100).toString();
        notifyListeners();
      }
    }
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '+' || x == '-' || x == '=') {
      return true;
    } else {
      return false;
    }
  }
}
