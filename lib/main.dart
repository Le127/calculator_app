import 'package:calculator_app/src/model/expressionModel.dart';
import 'package:flutter/material.dart';

import 'package:calculator_app/src/pages/calculator_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ExpressionModel()),
        ],
        child: MyApp(),
      ),
    );

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
