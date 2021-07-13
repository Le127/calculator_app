import 'package:flutter/material.dart';
import 'package:calculator_app/src/model/expressionModel.dart';
import 'package:provider/provider.dart';
import 'package:math_expressions/math_expressions.dart' as me;

class ButtonDefault extends StatefulWidget {
  final String keyPad;
  final Color color;
  ButtonDefault(this.keyPad, {this.color = Colors.grey});

  @override
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    final sizeButton = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);

    return GestureDetector(
      onTap: () {
        expressionModel.expression = widget.keyPad;
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(),
        ),
        child: Text(this.widget.keyPad),
      ),
    );
  }
}

//--------------------------------------
class ButtonEvaluate extends StatefulWidget {
  final Color color;
  ButtonEvaluate({required this.color});

  @override
  _ButtonEvaluateState createState() => _ButtonEvaluateState();
}

class _ButtonEvaluateState extends State<ButtonEvaluate> {
  @override
  Widget build(BuildContext context) {
    final sizeButton = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);

    return GestureDetector(
      onTap: () {
        try {
          me.Expression e = me.Parser().parse(expressionModel.expression);
          double result = e.evaluate(
            me.EvaluationType.REAL,
            me.ContextModel(),
          );
          expressionModel.setExpression = (result.toString());
          //_expressionError = false;
        } catch (error) {
          //_expressionError = true;
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(),
        ),
        child: Text("="),
      ),
    );
  }
}

//---------------------------------------
class ButtonC extends StatefulWidget {
  final Color color;
  ButtonC({this.color = Colors.grey});

  @override
  _ButtonCState createState() => _ButtonCState();
}

class _ButtonCState extends State<ButtonC> {
  @override
  Widget build(BuildContext context) {
    final sizeButton = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);

    return GestureDetector(
      onTap: () {
        expressionModel.setExpression = "";
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(),
        ),
        child: Text("C"),
      ),
    );
  }
}

//------------------------------------------

class ButtonBackspace extends StatefulWidget {
  final Color color;
  final Color iconColor;
  ButtonBackspace({this.color = Colors.grey, this.iconColor = Colors.black});

  @override
  _ButtonBackspaceState createState() => _ButtonBackspaceState();
}

class _ButtonBackspaceState extends State<ButtonBackspace> {
  @override
  Widget build(BuildContext context) {
    final sizeButton = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);

    return GestureDetector(
      onTap: () {
        expressionModel.setExpression = expressionModel.expression.isEmpty
            ? ""
            : expressionModel.expression
                .substring(0, expressionModel.expression.length - 1);
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(),
        ),
        child: Icon(
          Icons.backspace_outlined,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
