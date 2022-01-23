// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(0, 10, 150, 10),
           child: Column(
            children: <Widget>[
              
             
                 Text("FATHER     .",
                style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),),
                Text("+94123456789 ",
                style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),),
            ]
          ),
          ),
          Container(
            height: 53,
            width: 334,
            margin: EdgeInsets.only(
                top: 25.0, left: 30.0, right: 30.0, bottom: 25.0),
            child: RaisedButton(
                onPressed: () {},
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'images/alarm-warning-line.png',
                    height: 100.0,
                    width: 100.0,
                  ),
                  
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Text(
                        "Press To Call ",
                        style: TextStyle(fontSize: 23.0),
                      ))
                ],
                
              ),
               textColor: Colors.white,
                    color: Color(0xFFE7301C)),
              
          
            ),
          
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
    );
  }
}
