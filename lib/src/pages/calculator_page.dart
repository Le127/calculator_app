import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/widgets/display.dart';
import 'package:calculator_app/src/widgets/history.dart';
import 'package:calculator_app/src/widgets/pad.dart';
import 'package:calculator_app/src/models/settings_model.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsModel>(context);
    final isRounded = Provider.of<SettingsModel>(context).isRounded;

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
          onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: model.historyBackgroundColor,
                  actionsPadding: EdgeInsets.symmetric(horizontal: 15),
                  insetPadding: EdgeInsets.symmetric(horizontal: 65),
                  title: Text('Settings',
                      style: TextStyle(color: model.textColor)),
                  actions: [
                    ListTile(
                      leading:
                          Icon(Icons.lightbulb_outline, color: model.textColor),
                      title: Text(
                        'Dark theme',
                        style: TextStyle(color: model.textColor),
                      ),
                      trailing: Switch.adaptive(
                          value: model.isDark,
                          activeColor: model.specialButtonsColor,
                          onChanged: (value) {
                            model.isDark = value;
                            print(model.isDark);
                          }),
                    ),
                    ListTile(
                      leading: Icon(Icons.color_lens_outlined,
                          color: model.textColor),
                      title: Text(
                        'Color theme',
                        style: TextStyle(color: model.textColor),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          model.isOrange
                              ? model.isOrange = false
                              : model.isOrange = true;
                        },
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: model.buttonEvaluateColor),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.format_shapes_outlined,
                          color: model.textColor),
                      title: Text(
                        'Button shape',
                        style: TextStyle(color: model.textColor),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          isRounded
                              ? model.isRounded = false
                              : model.isRounded = true;
                        },
                        child: Container(
                          height: 25.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                              borderRadius: isRounded
                                  ? BorderRadius.all(Radius.elliptical(15, 15))
                                  : null,
                              color: model.buttonEvaluateColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          child: Icon(
            Icons.settings,
            color: model.textColor,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
