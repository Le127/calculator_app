import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/settings_model.dart';
import 'package:calculator_app/src/models/history_model.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Provider.of<SettingsModel>(context);
    final history = Provider.of<HistoryModel>(context).history.reversed;

    return Container(
      padding: EdgeInsets.only(top: 50.0),
      height: size.height * 0.3,
      width: size.width,
      color: color.historyBackgroundColor,
      child: ListView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        children: [
          ...history.map((e) => Column(
                children: [
                  Text(e),
                  SizedBox(height: 10.0),
                ],
              )),
        ],
      ),
    );
  }
}
