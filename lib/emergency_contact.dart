
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFDEDCD2),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: 60.0, left: 0.0, right: 170.0, bottom: 20.0),
              child: Text(
                "Emergency Contacts",
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            Container(
              height: 160.0,
              width: 370.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                  )
                ],
              ),
               padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Text("FATHER",
               style: TextStyle(fontSize: 22.0,
                 letterSpacing: 2.0
                 ),
               ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 55.0, left: 30.0, right: 30.0, bottom: 25.0),
              height: 59,
              width: 370,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
            ElevatedButton.icon(
              icon: Icon(FontAwesomeIcons.exclamationTriangle, size: 16),
              
              label: Text('Icon Button'),
              onPressed: () => {},
            
            ),]),),
            Container(
              margin: EdgeInsets.only(
                  top: 55.0, left: 30.0, right: 30.0, bottom: 25.0),
              height: 59,
              width: 301,
              child: ElevatedButton(
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 24.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(155, 154, 147, 1)),
                    
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
