import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel with ChangeNotifier {
  final String keyTheme = "theme";
  final String keyRounded = "rounded";
  final String keyColor = "color";

  late SharedPreferences _preferences;

  late bool _isDark;
  late bool _isOrange;
  late bool _isRounded;

  //Default settings
  SettingsModel() {
    _isDark = false;
    _isOrange = true;
    _isRounded = false;
    _loadFromPreferences();
  }

  Future<SharedPreferences> _initialPreferences() async =>
      _preferences = await SharedPreferences.getInstance();

  void _savePreferences() async {
    await _initialPreferences();
    _preferences.setBool(keyTheme, _isDark);
    _preferences.setBool(keyRounded, _isRounded);
    _preferences.setBool(keyColor, _isOrange);
  }

  void _loadFromPreferences() async {
    await _initialPreferences();
    isDark = _preferences.getBool(keyTheme) ?? false;
    isRounded = _preferences.getBool(keyRounded) ?? false;
    isOrange = _preferences.getBool(keyColor) ?? true;
    notifyListeners();
  }

  void clearPreferences() async {
    await _initialPreferences();
    await _preferences.clear();
    _loadFromPreferences();
  }

  toggleChangeTheme(bool value) {
    isDark = value;
    _savePreferences();
    notifyListeners();
  }

  void toggleChangeRounded() {
    isRounded = !_isRounded;
    _savePreferences();
    notifyListeners();
  }

  void toggleChangeColor() {
    isOrange = !_isOrange;
    _savePreferences();
    notifyListeners();
  }

  Color _textColor = Colors.black;
  Color _backgroundColor = Colors.amber.shade200;
  Color _historyBackgroundColor = Colors.amber.shade100;
  Color _buttonDefaultColor = Colors.amber.shade50;
  Color _specialButtonsColor = Colors.orange.withOpacity(0.8);
  Color _buttonEvaluateColor = Colors.orange.shade600;
  Color _hoverDefault = Colors.amber.shade100;
  Color _hoverEvaluate = Colors.orange.shade700;
  Color _hoverSpecial = Colors.orange;

  bool get isDark => this._isDark;
  bool get isOrange => this._isOrange;
  bool get isRounded => this._isRounded;

  Color get textColor => this._textColor;
  Color get backgroundColor => this._backgroundColor;
  Color get historyBackgroundColor => this._historyBackgroundColor;
  Color get buttonDefaultColor => this._buttonDefaultColor;
  Color get specialButtonsColor => this._specialButtonsColor;
  Color get buttonEvaluateColor => this._buttonEvaluateColor;
  Color get hoverDefault => this._hoverDefault;
  Color get hoverEvaluate => this._hoverEvaluate;
  Color get hoverSpecial => this._hoverSpecial;

  set isDark(bool value) {
    this._isDark = value;
    _changeColors(_isDark);
    notifyListeners();
  }

  set isOrange(bool value) {
    this._isOrange = value;
    _changeTheme(_isOrange);
    notifyListeners();
  }

  set isRounded(bool value) {
    this._isRounded = value;
    notifyListeners();
  }

  void _changeColors(bool isDark) {
    if (isDark) {
      _textColor = Colors.white;
      _backgroundColor = Colors.grey.shade600;
      _historyBackgroundColor = Colors.grey.shade700;
      _buttonDefaultColor = Colors.grey.shade500;
      _hoverDefault = Colors.grey.shade600;
    } else {
      _textColor = Colors.black;
      _backgroundColor = Colors.amber.shade200;
      _historyBackgroundColor = Colors.amber.shade100;
      _buttonDefaultColor = Colors.amber.shade50;
      _hoverDefault = Colors.amber.shade100;
    }
  }

  void _changeTheme(bool isOrange) {
    if (isOrange) {
      _specialButtonsColor = Colors.orange.withOpacity(0.8);
      _buttonEvaluateColor = Colors.orange.shade800;
      _hoverEvaluate = Colors.orange.shade900;
      _hoverSpecial = Colors.orange;
    } else {
      _specialButtonsColor = Colors.green.withOpacity(0.8);
      _buttonEvaluateColor = Colors.green.shade800;
      _hoverEvaluate = Colors.green.shade900;
      _hoverSpecial = Colors.green;
    }
  }
}
