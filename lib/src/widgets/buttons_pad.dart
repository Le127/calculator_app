import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/expressionModel.dart';
import 'package:calculator_app/src/models/settings_model.dart';
import 'package:calculator_app/src/models/history_model.dart';

class ButtonDefault extends StatefulWidget {
  final String keyPad;
  final Color color;
  ButtonDefault(this.keyPad, {required this.color});

  @override
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    final sizeButton = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);
    final color = Provider.of<SettingsModel>(context);
    final isRounded = Provider.of<SettingsModel>(context).isRounded;

    return GestureDetector(
      onTap: () {
        expressionModel.expression = widget.keyPad;
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          borderRadius:
              isRounded ? BorderRadius.all(Radius.elliptical(15, 15)) : null,
          color: widget.color,
          border: Border.all(color: color.backgroundColor, width: 1.0),
        ),
        child:
            Text(this.widget.keyPad, style: TextStyle(color: color.textColor)),
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
    final color = Provider.of<SettingsModel>(context);
    final isRounded = Provider.of<SettingsModel>(context).isRounded;
    final history = Provider.of<HistoryModel>(context);

    return GestureDetector(
      onTap: () {
        history.history =
            "${expressionModel.expression} = ${expressionModel.result()}";
        expressionModel.evaluate();
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          borderRadius:
              isRounded ? BorderRadius.all(Radius.elliptical(15, 15)) : null,
          color: widget.color,
          border: Border.all(color: color.backgroundColor, width: 1.0),
        ),
        child: Text("=", style: TextStyle(color: color.textColor)),
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
    final color = Provider.of<SettingsModel>(context);
    final isRounded = Provider.of<SettingsModel>(context).isRounded;

    return GestureDetector(
      onTap: () {
        expressionModel.setExpression = "";
        expressionModel.expressionError = false;
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          borderRadius:
              isRounded ? BorderRadius.all(Radius.elliptical(15, 15)) : null,
          color: widget.color,
          border: Border.all(color: color.backgroundColor, width: 1.0),
        ),
        child: Text("C", style: TextStyle(color: color.textColor)),
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
    final color = Provider.of<SettingsModel>(context);
    final isRounded = Provider.of<SettingsModel>(context).isRounded;

    return GestureDetector(
      onTap: () {
        expressionModel.setExpression = expressionModel.expression.isEmpty
            ? ""
            : expressionModel.expression
                .substring(0, expressionModel.expression.length - 1);
        expressionModel.expressionError = false;
      },
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width * 0.25,
        decoration: BoxDecoration(
          borderRadius:
              isRounded ? BorderRadius.all(Radius.elliptical(15, 15)) : null,
          color: widget.color,
          border: Border.all(color: color.backgroundColor, width: 1.0),
        ),
        child: Icon(Icons.backspace_outlined, color: color.textColor),
      ),
    );
  }
}
