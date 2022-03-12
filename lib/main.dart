import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tic_toc_toe/components/input_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlayerOne = true;
  List<String> list = ["", "", "", "", "", "", "", "", ""];
  bool isFinish = false;
  static const List<List<int>> isFinishlist = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  void _finishControl() {
    for (var a = 0; a < 5; a++) {
      var control = list[isFinishlist[a][0]];
      var control1 = list[isFinishlist[a][1]];
      var control2 = list[isFinishlist[a][2]];
      if (control == "" || control1 == "" || control2 == "") {
      } else if (control == control1 && control2 == control1) {
        setState(() {
          isFinish = true;
        });
      }
    }
  }

  // 0 - 1 - 2 "" 3 - 4 - 5 "" 6 - 7 - 8 "" 0 - 4 - 8 "" 2 - 4 - 6

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isFinish
          ? Center(
              child: SizedBox(
                height: 700,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        newMethod(0),
                        Container(
                          color: Colors.black,
                          width: 5,
                          height: 50,
                        ),
                        newMethod(1),
                        Container(
                          color: Colors.black,
                          width: 5,
                          height: 50,
                        ),
                        newMethod(2),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      width: 50,
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        newMethod(3),
                        Container(
                          color: Colors.black,
                          width: 5,
                          height: 50,
                        ),
                        newMethod(4),
                        Container(
                          color: Colors.black,
                          width: 5,
                          height: 50,
                        ),
                        newMethod(5),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      width: 50,
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        newMethod(6),
                        Container(
                          color: Colors.black,
                          width: 5,
                          height: 50,
                        ),
                        newMethod(7),
                        Container(
                          color: Colors.black,
                          width: 5,
                          height: 50,
                        ),
                        newMethod(8),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }

  InkWell newMethod(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (list[index] != "") return;
          list[index] = isPlayerOne ? "0" : "X";
          isPlayerOne = !isPlayerOne;
        });
        _finishControl();
      },
      child: InputBox(
        text: list[index],
        colors: isPlayerOne ? Colors.red : Colors.blue,
      ),
    );
  }
}
