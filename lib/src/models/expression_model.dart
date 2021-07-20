import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as me;
import 'package:calculator_app/src/helpers/functions.dart';

class ExpressionModel extends ChangeNotifier {
  String _expression = "";
  bool _expressionError = false;
  TextEditingController _controller = TextEditingController();
  String _textError = 'Error';

  String get expression => this._expression;
  bool get expressionError => this._expressionError;
  TextEditingController get controller => this._controller;
  String get textError => this._textError;

  set expression(value) {
    this._expression = "${this._expression}$value";
    _controller.text = "${this._controller.text}$value";
    notifyListeners();
  }

  set setExpression(String value) {
    _expression = value;
    _controller.text = value;
    _controller.selection = TextSelection.collapsed(offset: value.length);
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
      setExpression = (removeZeroDecimal(result.toString()));
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
