// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:ollin/home1.dart';

FlutterTts flutterTts = FlutterTts();
Future tell() async {
  await flutterTts.speak('Welcome to ollin, The indoor navigation for visual impared......');
}

void main() {
  runApp(MyApp());
  tell();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
