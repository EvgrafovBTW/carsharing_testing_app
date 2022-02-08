//import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:newflutterproject/camera.dart';
import 'package:newflutterproject/inspection02.dart';
import 'package:newflutterproject/inspection03.dart';
//import 'topBar.dart';
import 'textList.dart';
import 'camera.dart';

void main() => runApp(MaterialApp(
      title: 'App',
      home: const App(),
      routes: {
        'app': (context) => const App(),
        'inspect02': (context) => const Inspection02(),
        'camera': (context) => const CameraApp(),
        'inspect03': (context) => const Inspect03(),
      },
      debugShowCheckedModeBanner: false,
    ));

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TextList(),
    );
  }
}
