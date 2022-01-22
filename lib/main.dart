// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ollin/assist_me.dart';
import 'package:ollin/emergency_contact.dart';
import 'package:ollin/find_location.dart';

void main() {
  runApp(const MaterialApp(
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
              margin: EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0, bottom: 25.0),
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
                    MaterialPageRoute(builder: (context) => const AssistMe()),
                  );
                },
              ),
            ),
            Container(
              height: 111,
              width: 448,
              margin: EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0, bottom: 25.0),
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
                    MaterialPageRoute(
                        builder: (context) => const FindLocation()),
                  );
                },
              ),
            ),
            Container(
              height: 111,
              width: 448,
              margin: EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0, bottom: 25.0),
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
