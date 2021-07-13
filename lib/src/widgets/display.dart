import 'package:flutter/material.dart';
import 'package:calculator_app/src/model/expressionModel.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);
    final _controller = Provider.of<ExpressionModel>(context).controller;

    return Container(
      height: size.height * 0.2,
      width: size.width,
      color: Colors.grey.shade800,
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
