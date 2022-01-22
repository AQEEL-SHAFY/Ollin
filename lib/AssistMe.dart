// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AssistMe extends StatelessWidget {
  const AssistMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin:
                  const EdgeInsets.only(top: 700.0, left: 50.0, right: 50.0),
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
