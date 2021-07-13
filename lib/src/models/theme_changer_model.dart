import 'package:flutter/material.dart';

class ThemeChangerModel with ChangeNotifier {
  bool _isDark = false;
  Color _backgroundColor = Colors.amber.shade200;
  Color _historyBackgroundColor = Colors.amber.shade100;
  Color _buttonDefaultColor = Colors.amber.shade50;
  Color _specialButtonsColor = Colors.orange.withOpacity(0.8);
  Color _buttonEvaluateColor = Colors.orange;

  bool get isDark => this._isDark;
  Color get backgroundColor => this._backgroundColor;
  Color get historyBackgroundColor => this._historyBackgroundColor;
  Color get buttonDefaultColor => this._buttonDefaultColor;
  Color get specialButtonsColor => this._specialButtonsColor;
  Color get buttonEvaluateColor => this._buttonEvaluateColor;

  set isDark(bool value) {
    this._isDark = value;
    notifyListeners();
  }
}
