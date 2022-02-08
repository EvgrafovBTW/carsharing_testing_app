// ignore_for_file: file_names

import 'dart:developer';
//import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarClock createState() => _TopBarClock();
}

class _TopBarClock extends State<TopBar> {
  // ignore: unused_field
  late Timer _timer;
  static int time = 240;
  var _counter = Duration(seconds: time);
  double progValue = 0;
  bool expired = false;
  @override
  bool mounted = false;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        switch (expired) {
          case false:
            if (_counter > Duration.zero) {
              _counter -= const Duration(seconds: 1);
              progValue = progValue + 1 / time;
            } else {}
            if (_counter == Duration.zero) {
              expired = true;
              //progValue = 0;
              textColor = const Color.fromARGB(255, 240, 49, 35);
              barColor = const Color.fromARGB(255, 240, 49, 35);
              log('таймер дошёл до нуля');
            }
            break;
          case true:
            if (_counter >= Duration.zero) {
              _counter += const Duration(seconds: 1);
            }
            break;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Color textColor = Colors.black;
  Color barColor = const Color.fromARGB(255, 185, 183, 183);

  @override
  Widget build(BuildContext context) {
    final minutes = _counter.inMinutes;
    final seconds = _counter.inSeconds - minutes * Duration.secondsPerMinute;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Бесплатный осмотр'),
            Text(
              '$minutes:$seconds',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: textColor,
              ),
            ),
          ],
        ),
        LinearProgressIndicator(
          backgroundColor: Colors.white,
          color: barColor,
          minHeight: 2,
          value: progValue,
        ),
      ],
    );
  }
}
