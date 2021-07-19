import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/pages/calculator_page.dart';
import 'package:calculator_app/src/models/expression_model.dart';
import 'package:calculator_app/src/models/settings_model.dart';
import 'package:calculator_app/src/models/history_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ExpressionModel()),
          ChangeNotifierProvider(create: (_) => SettingsModel()),
          ChangeNotifierProvider(create: (_) => HistoryModel()),
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
