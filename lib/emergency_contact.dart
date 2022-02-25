// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ollin/add_contact.dart';
import 'package:ollin/entity/emergency_contact.dart';
import 'package:ollin/provider/emergency_contacts.dart';
import 'package:provider/provider.dart';

class EmergencyContactWidget extends StatefulWidget {
  const EmergencyContactWidget({Key? key}) : super(key: key);

  @override
  State<EmergencyContactWidget> createState() => _EmergencyContactWidgetState();
}

class _EmergencyContactWidgetState extends State<EmergencyContactWidget> {
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
            Consumer<EmergencyContacts>(builder: (context,emerge,child){
              return Container(
                height: 400,
                child: ListView.builder(
                    itemCount: emerge.emergencyContacts.length,
                    itemBuilder: (context, index){
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 0.0, left: 15.0, right: 15.0, bottom: 0.0),
                          child: Card(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(top: 0, left: 10)),
                                  Text(
                                    emerge.emergencyContacts[index].name,
                                    style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                                  ),
                                  Text(
                                    emerge.emergencyContacts[index].number,
                                    style: TextStyle(fontSize: 22.0, letterSpacing: 2.0),
                                  ),
                                  if (_isDelete) Container(
                                    height: 53,
                                    width: 334,
                                    margin: EdgeInsets.only(
                                        top: 15.0, left: 30.0, right: 30.0, bottom: 25.0),
                                    child: RaisedButton(
                                        onPressed: () {
                                          //Provider.of<EmergencyContacts>(context,listen: false).removeContact(emerge.emergencyContacts[index].id);
                                          emerge.removeContact(emerge.emergencyContacts[index].id!);
                                        },
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
                                                  "Remove ",
                                                  style: TextStyle(fontSize: 23.0),
                                                ))
                                          ],
                                        ),
                                        textColor: Colors.white,
                                        color: Color(0xFFE7301C)),
                                  ) else Container(
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
                      );
                    }),
              );
            })
            ,

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
                    MaterialPageRoute(builder: (context) => AddContact()),
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
