import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox({Key? key, required this.text, required this.colors})
      : super(key: key);

  final String text;
  final Color colors;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(color: Colors.blue, fontSize: 22),
          ),
        ));
  }
}
