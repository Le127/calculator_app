import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

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
            TextField(
              readOnly: readOnly,
              autofocus: true,
              focusNode: _myFocusNode,
              controller: _controller,
             /*  onChanged: (value) {
                print( _controller);
               
                expressionModel.setExpression = value;
              }, */
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_myFocusNode);
                expressionModel.result() != 'Error'
                    ? history.history =
                        "${expressionModel.expression} = ${expressionModel.result()}"
                    : history.history = '';

                expressionModel.evaluate();

                
              },
              decoration: InputDecoration.collapsed(hintText: null),
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 35,
                  color: color.textColor,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              error.expressionError ? error.textError : '',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
