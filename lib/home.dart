// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ollin/assist_me.dart';
import 'package:ollin/camera.dart';
import 'package:ollin/contacts.dart';

import 'package:ollin/find_location.dart';

FlutterTts flutterTts = FlutterTts();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.speak(
          'Wellcome to ollin, The indoor navigation for visual impared...... Aayubowan, Oba Ollin sewaawata saadarayen piligannawa');
    }

    Future _speak1() async {
      await flutterTts.speak('You have access the contacts');
    }

    _speak();
    return Scaffold(
      backgroundColor: Color(0xFFDEDCD2),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 90.0),
            child: Center(
              child: Image.asset('images/ollin_transparent.png'),
            ),
          ),
          Container(
            height: 111,
            width: 448,
            margin: EdgeInsets.only(
                top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
            child: ElevatedButton(
              child: Text(
                'Assist Me',
                style: TextStyle(fontSize: 24.0),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF014268)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                )),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cameraScreen()),
                );
              },
            ),
          ),
          Container(
            height: 111,
            width: 448,
            margin: EdgeInsets.only(
                top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
            child: ElevatedButton(
              child: Text(
                'Find My Location',
                style: TextStyle(fontSize: 24.0),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF9C866F)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                )),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FindLocation()),
                );
              },
            ),
          ),
          Container(
            height: 111,
            width: 448,
            margin: EdgeInsets.only(
                top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
            child: ElevatedButton(
              child: Text(
                'Emergency Contact',
                style: TextStyle(fontSize: 24.0),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFE7301C)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                )),
              ),
              onPressed: () {
                _speak1();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
