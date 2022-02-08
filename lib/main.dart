//import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:newflutterproject/inspection02.dart';
import 'topBar.dart';
import 'textList.dart';

void main() => runApp(MaterialApp(
      title: 'App',
      home: const App(),
      routes: {
        'app': (context) => const App(),
        'inspect02': (context) => const Inspection02(),
      },
      debugShowCheckedModeBanner: false,
    ));

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
// sample text
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TextList(),
    );
  }
}
