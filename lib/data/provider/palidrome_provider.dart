import 'package:flutter/material.dart';

class PalidromeProvider extends ChangeNotifier {
  String _palidResult = "";
  String get palidResult => _palidResult;

  set resultSet(String palidRes) {
    _palidResult = palidRes;
    notifyListeners();
  }

  void checkPalidrome(String text) {
    String oriText = text.replaceAll(' ', '');
    List<String> getReverse = oriText.split('');

    String getResult = getReverse.reversed.join();
    if (oriText == getResult) {
      resultSet = "isPalidrome";
    } else {
      resultSet = "not Palidrome";
    }
  }
}
