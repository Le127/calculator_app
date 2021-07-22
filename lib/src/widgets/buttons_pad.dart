import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/expression_model.dart';
import 'package:calculator_app/src/models/settings_model.dart';
import 'package:calculator_app/src/models/history_model.dart';

class ButtonDefault extends StatefulWidget {
  final String keyPad;
  final Color color;
  final Color hover;

  ButtonDefault(this.keyPad, {required this.color, required this.hover});

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

    return Container(
      margin: EdgeInsets.all(1.5),
      child: ElevatedButton(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          elevation: MaterialStateProperty.all(7),
          overlayColor: MaterialStateProperty.all(widget.hover),
          backgroundColor: MaterialStateProperty.all(widget.color),
          shape: isRounded
              ? MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))
              : null,
          fixedSize: MaterialStateProperty.all(
              Size(sizeButton.width * 0.25 - 3, sizeButton.height * 0.1 - 3)),
        ),
        onPressed: () {
          expressionModel.addToExpression(widget.keyPad);
        },
        child: Text(
          this.widget.keyPad,
          style: TextStyle(color: color.textColor, fontSize: 28),
        ),
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

    return Container(
      margin: EdgeInsets.all(1.5),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(7),
            overlayColor: MaterialStateProperty.all(color.hoverEvaluate),
            backgroundColor: MaterialStateProperty.all(widget.color),
            shape: isRounded
                ? MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))
                : null,
            fixedSize: MaterialStateProperty.all(Size(
                sizeButton.width * 0.25 - 3, sizeButton.height * 0.1 - 3))),
        onPressed: () {
          expressionModel.result() != 'Error'
              ? history.history =
                  "${expressionModel.expression} = ${expressionModel.result()}"
              : history.history = '';

          expressionModel.evaluate();
        },
        child:
            Text("=", style: TextStyle(color: color.textColor, fontSize: 25)),
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

    return Container(
      margin: EdgeInsets.all(1.5),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(7),
            overlayColor: MaterialStateProperty.all(color.hoverSpecial),
            backgroundColor: MaterialStateProperty.all(widget.color),
            shape: isRounded
                ? MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))
                : null,
            fixedSize: MaterialStateProperty.all(Size(
                sizeButton.width * 0.25 - 3, sizeButton.height * 0.1 - 3))),
        onPressed: () {
          expressionModel.expression = expressionModel.expression.isEmpty
              ? ""
              : expressionModel.expression
                  .substring(0, expressionModel.expression.length - 1);
          expressionModel.expressionError = false;
        },
        onLongPress: () {
          expressionModel.expression = "";
          expressionModel.expressionError = false;
        },
        child: Icon(
          Icons.backspace_outlined,
          color: color.hoverEvaluate,
          size: 30,
        ),
      ),
    );
  }
}
