import 'package:flutter/material.dart';

import 'package:calculator_app/src/pages/calculator_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalculatorApp',
      home: CalculatorPage(),
    );
  }
}
