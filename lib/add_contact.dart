// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_label, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDCD2),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 70.0, left: 20.0, right: 170.0, bottom: 20.0),
            child: Text(
              "Add Emergency Contacts",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 10.0, left: 20.0, right: 120.0, bottom: 20.0),
            child: Text(
              "Please make sure to add at least \none emergency contact in case of\nan emergency",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 10.0, left: 10.0, right: 230.0, bottom: 10.0),
            child: Text(
              "Name Of Contact",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            width: 379,
            height: 79,
            child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 20.0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 10.0, left: 10.0, right: 170.0, bottom: 10.0),
            child: Text(
              "Relationship Of Contact",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            width: 379,
            height: 79,
            child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 20.0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 10.0, left: 10.0, right: 230.0, bottom: 10.0),
            child: Text(
              "Contact Number",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            width: 379,
            height: 79,
            child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 20.0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
            height: 64,
            width: 370,
            child: ElevatedButton(
              child: Text(
                'Add Emergency Contact',
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
              onPressed: () async {
                await alertDialog(
                  context,
                );
              },
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0, bottom: .0),
            height: 60,
            width: 194,
            child: ElevatedButton(
              child: Text(
                'Back',
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

alertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
      
        
        Timer _timer;
        _timer = Timer(Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        

        return AlertDialog(
        backgroundColor: Color(0xFFDEDCD2),
      
          content: SingleChildScrollView(
            child: Image.asset('images/save.png')
            ,
          ),
        );
       // ignore: dead_code
       
      }).then((val) {
    // ignore: prefer_typing_uninitialized_variables
    var _timer;
    if (_timer.isActive) {
      _timer.cancel();
    }
  });
}
