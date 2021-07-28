// import 'package:calculator_app/src/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/widgets/display.dart';
import 'package:calculator_app/src/widgets/history.dart';
import 'package:calculator_app/src/widgets/pad.dart';
import 'package:calculator_app/src/models/settings_model.dart';
import 'package:calculator_app/src/models/history_model.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsModel>(context);
    final history = Provider.of<HistoryModel>(context);

    return Scaffold(
      body: Column(
        children: [
          History(),
          Display(),
          Pad(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            highlightElevation: 0.0,
            splashColor: model.buttonEvaluateColor,
            elevation: 0.0,
            hoverElevation: 0.0,
            onPressed: () => history.delete(),
            child: Icon(Icons.delete, color: model.textColor),
          ),
          FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              highlightElevation: 0.0,
              splashColor: model.buttonEvaluateColor,
              hoverElevation: 0.0,
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    final model = Provider.of<SettingsModel>(context);
                    final isRounded =
                        Provider.of<SettingsModel>(context).isRounded;

                    return AlertDialog(
                      backgroundColor: model.historyBackgroundColor,
                      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
                      insetPadding: EdgeInsets.symmetric(horizontal: 65),
                      title: Text('Settings',
                          style: TextStyle(color: model.textColor)),
                      actions: [
                        ListTile(
                          leading: Icon(Icons.lightbulb_outline,
                              color: model.textColor),
                          title: Text(
                            'Dark theme',
                            style: TextStyle(color: model.textColor),
                          ),
                          trailing: Switch.adaptive(
                              value: model.isDark,
                              activeColor: model.specialButtonsColor,
                              onChanged: (value) async {
                                await model.toggleChangeTheme(value);
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
                              model.toggleChangeColor();
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
                              model.toggleChangeRounded();
                            },
                            child: Container(
                              height: 25.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                  borderRadius: isRounded
                                      ? BorderRadius.all(
                                          Radius.elliptical(15, 15))
                                      : null,
                                  color: model.buttonEvaluateColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () => model.clearPreferences(),
                            child: Text("Reset",
                                style: TextStyle(
                                    color: model.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)))
                      ],
                    );
                  }),
              child: Icon(
                Icons.settings,
                color: model.textColor,
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
