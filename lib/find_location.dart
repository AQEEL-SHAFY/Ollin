// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ollin/emergency_contact.dart';
import '';

class FindLocation extends StatefulWidget {
  const FindLocation({Key? key}) : super(key: key);

  @override
  State<FindLocation> createState() => _FindLocationState();
}

class _FindLocationState extends State<FindLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          // Container(
          //   child: GoogleMap(
          //
          //   ),
          // ),
          Container(
            margin:
            const EdgeInsets.only(top: 450.0, left: 50.0, right: 50.0),
            height: 72,
            width: 309,
            child: ElevatedButton(
              child: Text(
                'Tell My Location',
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

              },
            ),
          ),
          Container(
            margin:
            const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
            height: 72,
            width: 309,
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
                      builder: (context) => const EmergencyContactWidget()),
                );
              },
            ),
          ),
          Container(
            margin:
            const EdgeInsets.only(top: 25.0, left: 50.0, right: 50.0),
            height: 89,
            width: 309,
            child: ElevatedButton(
              child: Text(
                'Back To Home',
                style: TextStyle(fontSize: 24.0),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF9B9A93)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )),
              ),
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


