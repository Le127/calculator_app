import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  List _history = [];
  String _result = '';

  List get history => _history;
  String get result => _result;

  set history(value) {
    _history.add(value);
    notifyListeners();
  }

  set result (value) {
    _result= value;
    notifyListeners();
  }

  void delete (){
    _history = [];
    notifyListeners();
  }
}
