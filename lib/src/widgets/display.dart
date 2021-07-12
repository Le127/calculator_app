import 'package:flutter/material.dart';

class Display extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _controller = TextEditingController();

    return Container(
      height: size.height * 0.2,
      width: size.width, 
      color: Colors.grey.shade800,
      child: Center(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration.collapsed(hintText: null),
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
