import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/expressionModel.dart';
import 'package:calculator_app/src/models/settings_model.dart';

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

    return Container(
      height: size.height * 0.2,
      width: size.width,
      color: color.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              focusNode: _myFocusNode,
              controller: _controller,
              onChanged: (value) {
                expressionModel.setExpression = value;
              },
              onSubmitted: (_) {
                expressionModel.evaluate();
                FocusScope.of(context).requestFocus(_myFocusNode);
              },
              decoration: InputDecoration.collapsed(hintText: null),
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 35, color: color.textColor, fontWeight: FontWeight.w600),
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
