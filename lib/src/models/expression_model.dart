import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as me;

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
    if (value.isEmpty) {
      _expressionError = false;
      print({"ENTRO", _expressionError});
    }
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
      setExpression = (result.toString());

      _expressionError = false;
      print({"resultadooo", result.toString().isEmpty});
    } catch (error) {
      _expressionError = true;
      print({"ERROR", _expressionError});
    }
  }
}
