import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/widgets/display.dart';
import 'package:calculator_app/src/widgets/history.dart';
import 'package:calculator_app/src/widgets/pad.dart';
import 'package:calculator_app/src/models/theme_changer_model.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeChangerModel>(context);
    return Scaffold(
      body: Column(
        children: [
          History(),
          Display(),
          Pad(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        hoverElevation: 0.0,
        onPressed: () =>
            model.isDark ? model.isDark = false : model.isDark = true,
        child: model.isDark
            ? Icon(
                Icons.light_mode_rounded, color: model.textColor,
              )
            : Icon(
                Icons.dark_mode_rounded, color: model.textColor,
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
