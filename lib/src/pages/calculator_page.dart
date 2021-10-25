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
          //History of all calculations
          History(),
          //Show the result
          Display(),
          //All calculator keys
          Pad(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Delete all history
          DeleteButton(model: model, history: history),
          //Settings
          SetupButton(model: model),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

//
//---Useful Widgets---

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.model,
    required this.history,
  }) : super(key: key);

  final SettingsModel model;
  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      highlightElevation: 0.0,
      splashColor: model.buttonEvaluateColor,
      elevation: 0.0,
      tooltip: "Delete all history",
      hoverElevation: 0.0,
      onPressed: () => history.delete(),
      child: Icon(Icons.delete, color: model.textColor),
    );
  }
}

class SetupButton extends StatelessWidget {
  const SetupButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SettingsModel model;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      highlightElevation: 0.0,
      splashColor: model.buttonEvaluateColor,
      hoverElevation: 0.0,
      onPressed: () => showDialog(
          context: context,
          builder: (context) {
            final model = Provider.of<SettingsModel>(context);
            final isRounded = Provider.of<SettingsModel>(context).isRounded;

            return AlertDialog(
              backgroundColor: model.historyBackgroundColor,
              actionsPadding: EdgeInsets.symmetric(horizontal: 15),
              insetPadding: EdgeInsets.symmetric(horizontal: 65),
              title: Text('Settings', style: TextStyle(color: model.textColor)),
              actions: [
                DarkTheme(model: model),
                ColorTheme(model: model),
                ButtonShape(model: model, isRounded: isRounded),
                SizedBox(height: 25),
                ResetButton(model: model)
              ],
            );
          }),
      child: Icon(
        Icons.settings,
        color: model.textColor,
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SettingsModel model;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () => model.clearPreferences(),
        child: Text("Reset",
            style: TextStyle(
                color: model.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 15)));
  }
}

class ButtonShape extends StatelessWidget {
  const ButtonShape({
    Key? key,
    required this.model,
    required this.isRounded,
  }) : super(key: key);

  final SettingsModel model;
  final bool isRounded;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.format_shapes_outlined, color: model.textColor),
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
                  ? BorderRadius.all(Radius.elliptical(15, 15))
                  : null,
              color: model.buttonEvaluateColor),
        ),
      ),
    );
  }
}

class ColorTheme extends StatelessWidget {
  const ColorTheme({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SettingsModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.color_lens_outlined, color: model.textColor),
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
              shape: BoxShape.circle, color: model.buttonEvaluateColor),
        ),
      ),
    );
  }
}

class DarkTheme extends StatelessWidget {
  const DarkTheme({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SettingsModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.lightbulb_outline, color: model.textColor),
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
    );
  }
}
