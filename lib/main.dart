// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ollin/AssistMe.dart';
import 'package:ollin/EmergencyContact.dart';
import 'package:ollin/FindLocation.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFDEDCD2),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Image.asset('images/ollin_transparent.png'),
              ),
            ),
            Container(
              height: 111,
              width: 448,
             
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text(
                  'Assist Me',
                  style: TextStyle(fontSize: 24.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(1, 66, 104, 1)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AssistMe()),
                  );
                },
              ),
            ),
             Container(
              height: 111,
              width: 448,
              
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text(
                  'Find My Location',
                  style: TextStyle(fontSize: 24.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(156, 134, 111, 1)),
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindLocation()),
                  );
                },
              ),
            ),
             Container(
              height: 111,
              width: 448,
              
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text(
                  'Emergency Contact',
                  style: TextStyle(fontSize: 24.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(231, 48, 28, 1)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmergencyContact()),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


