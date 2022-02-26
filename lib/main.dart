// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:stopwatch/async_programming.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AsyncProgram(),
    );
  }
}

class MyWatch extends StatefulWidget {
  MyWatch({Key? key}) : super(key: key);

  @override
  State<MyWatch> createState() => _MyWatchState();
}

class _MyWatchState extends State<MyWatch> {
  Stream startStream() async* {
    int i = 0;
    for (;;) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }


  

  int seconds = 50;
  int minute = 59;
  int hour = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            StreamBuilder(
                stream: startStream(),
                builder: (context, snapshot) {
                  if (isStart) {
                    seconds++;
                  }
                  if (seconds == 60) {
                    minute++;
                    seconds = 0;
                  }
                  if (minute == 60) {
                    hour++;
                    minute = 0;
                  }
                  if (hour == 12) {
                    seconds = 0;
                    minute = 0;
                    hour = 0;
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$hour : "),
                      Text("$minute : "),
                      Text("$seconds"),
                    ],
                  );
                }),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (isStart) {
                      pauseTimer();
                    } else {
                      startTimer();
                    }
                  },
                  child: Text(isStart ? "Pause" : "Start"),
                ),
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text("Reset"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isStart = false;

  startTimer() {
    setState(() {
      isStart = true;
    });
  }

  pauseTimer() {
    setState(() {
      isStart = false;
    });
  }

  resetTimer() {
    setState(() {
      isStart = false;
      seconds = 0;
      minute = 0;
      hour = 0;
    });
  }
}
