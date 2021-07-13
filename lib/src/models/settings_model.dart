import 'package:flutter/material.dart';

class SettingsModel with ChangeNotifier {
  bool _isDark = false;
  bool _isOrange = true;
  bool _isRounded = false;

  Color _textColor = Colors.black;
  Color _backgroundColor = Colors.amber.shade200;
  Color _historyBackgroundColor = Colors.amber.shade100;
  Color _buttonDefaultColor = Colors.amber.shade50;
  Color _specialButtonsColor = Colors.orange.withOpacity(0.8);
  Color _buttonEvaluateColor = Colors.orange;

  bool get isDark => this._isDark;
  bool get isOrange => this._isOrange;
  bool get isRounded => this._isRounded;

  Color get textColor => this._textColor;
  Color get backgroundColor => this._backgroundColor;
  Color get historyBackgroundColor => this._historyBackgroundColor;
  Color get buttonDefaultColor => this._buttonDefaultColor;
  Color get specialButtonsColor => this._specialButtonsColor;
  Color get buttonEvaluateColor => this._buttonEvaluateColor;

  set isDark(bool value) {
    this._isDark = value;
    changeColors(_isDark);
    notifyListeners();
  }

  set isOrange(bool value) {
    this._isOrange = value;
    changeTheme(_isOrange);
    notifyListeners();
  }

  set isRounded(bool value) {
    this._isRounded = value;
    notifyListeners();
  }

  void changeColors(bool isDark) {
    if (isDark) {
      _textColor = Colors.white;
      _backgroundColor = Colors.grey.shade600;
      _historyBackgroundColor = Colors.grey.shade700;
      _buttonDefaultColor = Colors.grey.shade500;
    } else {
      _textColor = Colors.black;
      _backgroundColor = Colors.amber.shade200;
      _historyBackgroundColor = Colors.amber.shade100;
      _buttonDefaultColor = Colors.amber.shade50;
    }
  }

  void changeTheme(bool isOrange) {
    if (isOrange) {
      _specialButtonsColor = Colors.orange.withOpacity(0.8);
      _buttonEvaluateColor = Colors.orange;
    } else {
      _specialButtonsColor = Colors.green.withOpacity(0.8);
      _buttonEvaluateColor = Colors.green;
    }
  }
}
