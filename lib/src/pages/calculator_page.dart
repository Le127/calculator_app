import 'package:flutter/material.dart';

import 'package:calculator_app/src/widgets/display.dart';
import 'package:calculator_app/src/widgets/history.dart';
import 'package:calculator_app/src/widgets/pad.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        History(),
        Display(),
        Pad(),
      ],
    ));
  }
}
