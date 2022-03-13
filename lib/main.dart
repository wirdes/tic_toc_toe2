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
  String winner = "";
  static const List<List<int>> isFinishlist = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
  ];

  void _finishControl() {
    if (!list.contains("")) {
      setState(() {
        isFinish = true;
        winner = "No one";
      });
    }
    for (var a = 0; a < 5; a++) {
      var control = list[isFinishlist[a][0]];
      var control1 = list[isFinishlist[a][1]];
      var control2 = list[isFinishlist[a][2]];
      if (control == "" || control1 == "" || control2 == "") {
      } else if (control == control1 && control2 == control1) {
        setState(() {
          isFinish = true;
          winner = control;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isFinish
          ? Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rows(0),
                    const Divider(
                      isHorizontal: true,
                    ),
                    rows(3),
                    const Divider(
                      isHorizontal: true,
                    ),
                    rows(6),
                  ],
                ),
              ),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Game Finish"),
                  Text(winner + " Winner"),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isFinish = false;
                          isPlayerOne = true;
                          list = ["", "", "", "", "", "", "", "", ""];
                        });
                      },
                      child: const Text("Play Again ?")),
                ],
              ),
            ),
    );
  }

  Row rows(int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getInputBox(i),
        const Divider(),
        getInputBox(i + 1),
        const Divider(),
        getInputBox(i + 2),
      ],
    );
  }

  Widget getInputBox(int index) {
    return InputBox(
        text: list[index],
        onTapFunc: () {
          setState(() {
            if (list[index] != "") return;
            list[index] = isPlayerOne ? "0" : "X";
            isPlayerOne = !isPlayerOne;
          });
          _finishControl();
        },
        index: index);
  }
}

class Divider extends StatelessWidget {
  const Divider({Key? key, this.isHorizontal = false}) : super(key: key);
  final bool? isHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: isHorizontal! ? 150 : 5,
      height: isHorizontal! ? 5 : 50,
    );
  }
}
