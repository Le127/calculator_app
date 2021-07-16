import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/settings_model.dart';
import 'package:calculator_app/src/widgets/buttons_pad.dart';

class Pad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Provider.of<SettingsModel>(context);

    return Container(
      height: size.height * 0.5,
      width: size.width,
      color: color.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              ButtonDefault("%",
                  color: color.specialButtonsColor, hover: color.hoverSpecial),
              ButtonDefault("CE",
                  color: color.specialButtonsColor, hover: color.hoverSpecial),
              ButtonC(color: color.specialButtonsColor),
              ButtonBackspace(color: color.specialButtonsColor)
            ],
          ),
          Row(
            children: [
              ButtonDefault("7",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("8",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("9",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("/",
                  color: color.specialButtonsColor, hover: color.hoverSpecial)
            ],
          ),
          Row(
            children: [
              ButtonDefault("4",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("5",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("6",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("*",
                  color: color.specialButtonsColor, hover: color.hoverSpecial)
            ],
          ),
          Row(
            children: [
              ButtonDefault("1",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("2",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("3",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault("-",
                  color: color.specialButtonsColor, hover: color.hoverSpecial)
            ],
          ),
          Row(
            children: [
              ButtonDefault("0",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonDefault(".",
                  color: color.buttonDefaultColor, hover: color.hoverDefault),
              ButtonEvaluate(color: color.buttonEvaluateColor),
              ButtonDefault("+",
                  color: color.specialButtonsColor, hover: color.hoverSpecial)
            ],
          ),
        ],
      ),
    );
  }
}
