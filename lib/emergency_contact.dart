// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ollin/add_contact.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({Key? key}) : super(key: key);

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  bool _isDelete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDCD2),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: 60.0, left: 0.0, right: 170.0, bottom: 20.0),
              child: Text(
                "Emergency Contacts",
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: 0.0, left: 15.0, right: 15.0, bottom: 5.0),
                child: Card(
                  child: Wrap(children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 0, left: 10)),
                    Text(
                      "FATHER               ",
                      style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                    ),
                    Text(
                      " +94123456789 ",
                      style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                    ),
                    _isDelete
                        ? Container(
                            height: 53,
                            width: 334,
                            margin: EdgeInsets.only(
                                top: 15.0,
                                left: 30.0,
                                right: 30.0,
                                bottom: 25.0),
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 1, 0, 0),
                                        child: Text(
                                          "Remove ",
                                          style: TextStyle(fontSize: 23.0),
                                        ))
                                  ],
                                ),
                                textColor: Colors.white,
                                color: Color(0xFFE7301C)),
                          )
                        : Container(
                            height: 53,
                            width: 334,
                            margin: EdgeInsets.only(
                                top: 15.0,
                                left: 30.0,
                                right: 30.0,
                                bottom: 25.0),
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 1, 0, 0),
                                        child: Text(
                                          "Press To Call ",
                                          style: TextStyle(fontSize: 23.0),
                                        ))
                                  ],
                                ),
                                textColor: Colors.white,
                                color: Color(0xFFE7301C)),
                          ),
                  ]),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: 0.0, left: 15.0, right: 15.0, bottom: 5.0),
                child: Card(
                  child: Wrap(children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 0, left: 10)),
                    Text(
                      "HOSPITAL                        ",
                      style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                    ),
                    Text(
                      " 1990 ",
                      style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                    ),
                    Container(
                      height: 53,
                      width: 334,
                      margin: EdgeInsets.only(
                          top: 15.0, left: 30.0, right: 30.0, bottom: 25.0),
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
                  ]),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: 0.0, left: 15.0, right: 15.0, bottom: 0.0),
                child: Card(
                  child: Wrap(children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 0, left: 10)),
                    Text(
                      "POLICE                              ",
                      style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                    ),
                    Text(
                      " 119 ",
                      style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                    ),
                    Container(
                      height: 53,
                      width: 334,
                      margin: EdgeInsets.only(
                          top: 15.0, left: 30.0, right: 30.0, bottom: 25.0),
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
                  ]),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddContact()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.0, left: 20.0, right: 20.0, bottom: 10.0),
              height: 64,
              width: 370,
              child: ElevatedButton(
                child: Text(
                  'Remove Emergency Contact',
                  style: TextStyle(fontSize: 24.0, color: Color(0xFFE7301C)),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFDEDCD2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(width: 2, color: Color(0xFFE7301C)),
                    ))),
                onPressed: () {
                  setState(() {
                    _isDelete = !_isDelete;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 5.0, left: 30.0, right: 30.0, bottom: .0),
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
          ],
        ),
      ),
    );
  }
}
