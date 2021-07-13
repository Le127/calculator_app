import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/theme_changer_model.dart';
import 'package:calculator_app/src/widgets/buttons_pad.dart';

class Pad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Provider.of<ThemeChangerModel>(context);

    return Container(
      height: size.height * 0.5,
      width: size.width,
      child: Column(
        children: [
          Row(
            children: [
              ButtonDefault("%", color: color.specialButtonsColor),
              ButtonDefault("CE", color: color.specialButtonsColor),
              ButtonC(color: color.specialButtonsColor),
              ButtonBackspace(color: color.specialButtonsColor)
            ],
          ),
          Row(
            children: [
              ButtonDefault("7", color: color.buttonDefaultColor),
              ButtonDefault("8", color: color.buttonDefaultColor),
              ButtonDefault("9", color: color.buttonDefaultColor),
              ButtonDefault("/", color: color.specialButtonsColor)
            ],
          ),
          Row(
            children: [
              ButtonDefault("4", color: color.buttonDefaultColor),
              ButtonDefault("5", color: color.buttonDefaultColor),
              ButtonDefault("6", color: color.buttonDefaultColor),
              ButtonDefault("*", color: color.specialButtonsColor)
            ],
          ),
          Row(
            children: [
              ButtonDefault("1", color: color.buttonDefaultColor),
              ButtonDefault("2", color: color.buttonDefaultColor),
              ButtonDefault("3", color: color.buttonDefaultColor),
              ButtonDefault("-", color: color.specialButtonsColor)
            ],
          ),
          Row(
            children: [
              ButtonDefault("0", color: color.buttonDefaultColor),
              ButtonDefault(".", color: color.buttonDefaultColor),
              ButtonEvaluate(color: color.buttonEvaluateColor),
              ButtonDefault("+", color: Colors.orange.withOpacity(0.8))
            ],
          ),
        ],
      ),
    );
  }
}
