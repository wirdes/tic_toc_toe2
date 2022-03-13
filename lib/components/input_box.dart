import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox({
    Key? key,
    required this.text,
    required this.onTapFunc,
    required this.index,
  }) : super(key: key);
  final void Function() onTapFunc;
  final String text;
  //final Color colors;
  final int index;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapFunc,
      child: SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.blue, fontSize: 22),
            ),
          )),
    );
  }
}
