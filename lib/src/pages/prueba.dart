import 'package:calculator_app/src/models/expressionModel.dart';
import 'package:calculator_app/src/models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PruebaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ButtonDefault("PRUEBA", color: Colors.red));
  }
}

class ButtonDefault extends StatefulWidget {
  final String keyPad;
  final Color color;
  ButtonDefault(this.keyPad, {required this.color});

  @override
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  Widget build(BuildContext context) {
    final sizeButton = MediaQuery.of(context).size;
    final expressionModel = Provider.of<ExpressionModel>(context);
    final color = Provider.of<SettingsModel>(context);
    final isRounded = Provider.of<SettingsModel>(context).isRounded;

    return ElevatedButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(widget.color.withRed(50)),
          backgroundColor: MaterialStateProperty.all(widget.color),
          shape: isRounded
              ? MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))
              : null,
          fixedSize: MaterialStateProperty.all(
              Size(sizeButton.width * 0.25, sizeButton.height * 0.1))),
      onPressed: () {
        expressionModel.expression = widget.keyPad;
      },
      child: Text(this.widget.keyPad, style: TextStyle(color: color.textColor)),
    );
  }
}
