import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/src/models/theme_changer_model.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Provider.of<ThemeChangerModel>(context);

    return Container(
      height: size.height * 0.3,
      width: size.width,
      color: color.historyBackgroundColor,
      child: Text("History"),
    );
  }
}
