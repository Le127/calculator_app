import 'package:flutter/material.dart';
import 'package:calculator_app/src/widgets/buttons_pad.dart';

class Pad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      width: size.width,
      child: Column(
        children: [
          Row(
            children: [
              ButtonDefault("%", color: Colors.orange.withOpacity(0.8)),
              ButtonDefault("CE", color: Colors.orange.withOpacity(0.8)),
              ButtonC(color: Colors.orange.withOpacity(0.8)),
              ButtonBackspace(color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              ButtonDefault("7"),
              ButtonDefault("8"),
              ButtonDefault("9"),
              ButtonDefault("/", color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              ButtonDefault("4"),
              ButtonDefault("5"),
              ButtonDefault("6"),
              ButtonDefault("*", color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              ButtonDefault("1"),
              ButtonDefault("2"),
              ButtonDefault("3"),
              ButtonDefault("-", color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              ButtonDefault("0"),
              ButtonDefault("."),
              ButtonEvaluate(color: Colors.orange),
              ButtonDefault("+", color: Colors.orange.withOpacity(0.8))
            ],
          ),
        ],
      ),
    );
  }
}
