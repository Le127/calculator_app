import 'package:flutter/material.dart';

class Pad extends StatelessWidget {
  const Pad({Key? key}) : super(key: key);

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
              _Button("%", color: Colors.orange.withOpacity(0.8)),
              _Button("CE", color: Colors.orange.withOpacity(0.8)),
              _Button("C", color: Colors.orange.withOpacity(0.8)),
              _Button("X", color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              _Button("7"),
              _Button("8"),
              _Button("9"),
              _Button("/", color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              _Button("4"),
              _Button("5"),
              _Button("6"),
              _Button("*", color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              _Button("1"),
              _Button("2"),
              _Button("3"),
              _Button("-", color: Colors.orange.withOpacity(0.8))
            ],
          ),
          Row(
            children: [
              _Button("0"),
              _Button("."),
              _Button("=", color: Colors.orange),
              _Button("+", color: Colors.orange.withOpacity(0.8))
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String keyPad;
  final Color color;
  _Button(this.keyPad, {this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    final sizeButton = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){print(keyPad);},
      child: Container(
        alignment: Alignment.center,
        height: sizeButton.height * 0.1,
        width: sizeButton.width *0.25,
    
        decoration: BoxDecoration(
            color: color, border: Border.all(), ),
        child: Text(this.keyPad),
      ),
    );
  }
}
