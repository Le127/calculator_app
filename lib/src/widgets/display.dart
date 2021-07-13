import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/expressionModel.dart';
import 'package:calculator_app/src/models/theme_changer_model.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);
    final _controller = Provider.of<ExpressionModel>(context).controller;
    final color = Provider.of<ThemeChangerModel>(context);

    return Container(
      height: size.height * 0.2,
      width: size.width,
      color: color.backgroundColor,
      child: Center(
        child: TextField(
          autofocus: true,
          controller: _controller,
          onChanged: (value) {
            expressionModel.setExpression = value;
          },
          onSubmitted: (_) => expressionModel.evaluate(),
          decoration: InputDecoration.collapsed(hintText: null),
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
