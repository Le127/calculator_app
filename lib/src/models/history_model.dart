import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  List<String> _history = [];

  List<String> get history => _history;

  set history(value) {
    if (value != '' ) {
      _history.insert(0,value);
      
    }
    notifyListeners();
  }

  void delete() {
    _history = [];
    notifyListeners();
  }
}
