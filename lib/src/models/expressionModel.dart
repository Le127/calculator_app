import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as me;

class ExpressionModel extends ChangeNotifier {
  String _expression = "";
  TextEditingController _controller = TextEditingController();

  String get expression => this._expression;
  TextEditingController get controller => this._controller;

  set expression(value) {
    this._expression = "${this._expression}$value";
    _controller.text = "${this._controller.text}$value";
    print(_expression);
    notifyListeners();
  }

  set setExpression(String value) {
    _expression = value;
    _controller.text = value;
    _controller.selection = TextSelection.collapsed(offset: value.length);
  }

  void evaluate() {
    try {
      me.Expression e = me.Parser().parse(this._expression);
      double result = e.evaluate(
        me.EvaluationType.REAL,
        me.ContextModel(),
      );
      setExpression = (result.toString());
      //_expressionError = false;
    } catch (error) {
      //_expressionError = true;
    }
  }
}
