// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'google_map.dart';

FlutterTts flutterTts = FlutterTts();

class FindLocation extends StatefulWidget {
  const FindLocation({Key? key}) : super(key: key);

  @override
  State<FindLocation> createState() => _FindLocationState();
}

class _FindLocationState extends State<FindLocation> {
  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.speak('You can find the location here');
    }

    _speak();
    return Scaffold(
      backgroundColor: Color(0xFFDEDCD2),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CurrentLocationScreen(),
              ),
            ]),
      ),
    );
  }
}
