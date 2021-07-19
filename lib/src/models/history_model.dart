import 'package:calculator_app/src/helpers/functions.dart';
import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  List<String> _history = [];

  List<String> get history => _history;

  set history(value) {
    _history.add(removeZeroDecimal(value));
    notifyListeners();
  }

  void delete() {
    _history = [];
    notifyListeners();
  }
}
