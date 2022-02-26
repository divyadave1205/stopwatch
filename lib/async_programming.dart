// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AsyncProgram extends StatefulWidget {
  AsyncProgram({Key? key}) : super(key: key);

  @override
  State<AsyncProgram> createState() => _AsyncProgramState();
}

class _AsyncProgramState extends State<AsyncProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            withoutAsync();
            print("object");
          });
        },
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

withAsync() async {
  await Future.delayed(Duration(seconds: 3));
  print("why");
  return Container(
    height: 100,
    width: 100,
    color: Colors.yellow,
    child: Text("data"),
  );
}

withoutAsync() {
  print("yes");
  
}
