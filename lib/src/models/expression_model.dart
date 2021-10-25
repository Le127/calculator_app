import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as me;
import 'package:calculator_app/src/helpers/functions.dart';

class ExpressionModel extends ChangeNotifier {
  String _expression = "";
  bool _expressionError = false;
  TextEditingController _controller = TextEditingController();
  String _textError = 'Error';
  bool _wasEvaluate = false;

  String get expression => this._expression;
  bool get expressionError => this._expressionError;
  TextEditingController get controller => this._controller;
  String get textError => this._textError;

  void addToExpression(String value) {
    this.expression = _buildNewExpression(value);
    _wasEvaluate = false;
  }

  // Allows you to continue a calculation or start a new one
  String _buildNewExpression(String value) {
    if (!_wasEvaluate) {
      return "${this._expression}$value";
    } else if (_wasEvaluate &&
        (value == '*' ||
            value == '/' ||
            value == '-' ||
            value == '+' ||
            value == '^')) {
      return "${this._expression}$value";
    } else {
      return value;
    }
  }

  set expression(String value) {
    _expression = value;
    _controller.text = value;
    _controller.selection = TextSelection.collapsed(offset: value.length);
    _wasEvaluate = false;
    notifyListeners();
  }

  set expressionError(bool value) {
    _expressionError = value;
    notifyListeners();
  }

  void evaluate() {
    try {
      me.Expression e = me.Parser().parse(this._expression);
      double result = e.evaluate(
        me.EvaluationType.REAL,
        me.ContextModel(),
      );
      this.expression = removeZeroDecimal(result.toString());
      _wasEvaluate = true;
      _expressionError = false;
    } catch (error) {
      _expressionError = true;
    }
  }

  String result() {
    try {
      me.Expression e = me.Parser().parse(this._expression);
      double result = e.evaluate(
        me.EvaluationType.REAL,
        me.ContextModel(),
      );

      return (removeZeroDecimal(result.toString()));
    } catch (error) {
      return _textError;
    }
  }
}
