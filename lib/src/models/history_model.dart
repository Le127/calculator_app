import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  List _history = [];

  List get history => _history;

  set history(value) {
    _history.add(value);
    notifyListeners();
  }

  void delete (){
    _history = [];
    notifyListeners();
  }
}
