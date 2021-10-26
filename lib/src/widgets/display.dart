import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show MaxLengthEnforcement;

import 'package:calculator_app/src/models/expression_model.dart';
import 'package:calculator_app/src/models/settings_model.dart';
import 'package:calculator_app/src/models/history_model.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late FocusNode _myFocusNode;

  @override
  void initState() {
    _myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);
    final _controller = Provider.of<ExpressionModel>(context).controller;
    final color = Provider.of<SettingsModel>(context);
    final error = Provider.of<ExpressionModel>(context);
    final history = Provider.of<HistoryModel>(context);
    bool readOnly = false;

    // only allows keyboard input from the desktop
    if (Platform.isAndroid || Platform.isIOS) {
      readOnly = true;
    } else {
      readOnly = false;
    }

    return Container(
      height: size.height * 0.2,
      width: size.width,
      color: color.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputAndResultViewer(
                readOnly: readOnly,
                myFocusNode: _myFocusNode,
                controller: _controller,
                color: color,
                expressionModel: expressionModel,
                history: history),

            // if there is an error in the result, it displays an error message. Otherwise, it returns an empty string.
            ErrorHandler(error: error),
          ],
        ),
      ),
    );
  }
}

//---Useful Widgets---

class InputAndResultViewer extends StatelessWidget {
  const InputAndResultViewer({
    Key? key,
    required this.readOnly,
    required FocusNode myFocusNode,
    required TextEditingController controller,
    required this.color,
    required this.expressionModel,
    required this.history,
  })  : _myFocusNode = myFocusNode,
        _controller = controller,
        super(key: key);

  final bool readOnly;
  final FocusNode _myFocusNode;
  final TextEditingController _controller;
  final SettingsModel color;
  final ExpressionModel expressionModel;
  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorWidth: 0,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      readOnly: readOnly,
      autofocus: true,
      focusNode: _myFocusNode,
      controller: _controller,
      decoration: InputDecoration(
        hintText: null,
        isCollapsed: true,
        counterText: "",
        border: InputBorder.none,
      ),
      textAlign: TextAlign.end,
      style: TextStyle(
        fontSize: 35,
        color: color.textColor,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
      onChanged: (String value) {
        if (expressionModel.expression ==
            value.substring(0, value.length - 1)) {
          String lastChar = value[value.length - 1];
          expressionModel.addToExpression(lastChar);
        } else {
          expressionModel.expression = value;
        }
      },
      onSubmitted: (_) {
        FocusScope.of(context).requestFocus(_myFocusNode);
        expressionModel.result() != 'Error'
            ? history.history =
                "${expressionModel.expression} = ${expressionModel.result()}"
            : history.history = '';

        expressionModel.evaluate();
      },
    );
  }
}

class ErrorHandler extends StatelessWidget {
  const ErrorHandler({
    Key? key,
    required this.error,
  }) : super(key: key);

  final ExpressionModel error;

  @override
  Widget build(BuildContext context) {
    return Text(
      error.expressionError ? error.textError : '',
      style: TextStyle(color: Colors.red),
    );
  }
}
