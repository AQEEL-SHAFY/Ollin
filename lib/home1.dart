// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ollin/camera.dart';
import 'package:ollin/contacts.dart';
import 'package:ollin/find_location.dart';

FlutterTts flutterTts = FlutterTts();
Future _speak1() async {
  await flutterTts.speak('You have access the contacts');
}

//Common constants
const containerCommonPadding = EdgeInsets.only(left: 20, right: 20);

//large scrren constants
const containerMaxMargin = EdgeInsets.only(top: 100);
const logoMaxImageheight = 200.0;
const logoMaxImageWidth = 200.0;
const buttonMaxPadding = EdgeInsets.only(top: 40, bottom: 40);

//small screen constants
const containerMinMargin = EdgeInsets.only(top: 60);
const logoMinImageheight = 170.0;
const logoMinImageWidth = 170.0;
const buttonMinPadding = EdgeInsets.only(top: 30, bottom: 30);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.speak(
          'Welcome to ollin, The indoor navigation for visual impared......');
    }

    _speak();
    return Scaffold(
      backgroundColor: Color(0xFFDEDCD2),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 410) {
            return _screenLarger(context);
          } else {
            return _screenSmaller(context);
          }
        },
      ),
    );
  }
}

Widget _screenLarger(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFDEDCD2),
    body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
            padding: containerCommonPadding,
            child: Column(
              children: [
                Container(
                  margin: containerMaxMargin,
                ),

                GestureDetector(
                  child: SizedBox(
                    height: logoMaxImageheight,
                    width: logoMaxImageWidth,
                    child: Image.asset(
                      'images/ollin_transparent.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindLocation()),
                    );
                  },
                ),

                SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Padding(
                      padding: buttonMaxPadding,
                      child: Text(
                        'Assist Me',
                        style: TextStyle(fontSize: 24),
                      ),
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
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Padding(
                      padding: buttonMaxPadding,
                      child: Text(
                        'Find My Location',
                        style: TextStyle(fontSize: 24.0),
                      ),
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

                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Padding(
                      padding: buttonMaxPadding,
                      child: Text(
                        'Emergency Contacts',
                        style: TextStyle(fontSize: 24.0),
                      ),
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
                            builder: (context) => const ContactPage()),
                      );
                      _speak1();
                    },
                  ),
                )
              ],
            )),
      ]),
    ),
  );
}

Widget _screenSmaller(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFDEDCD2),
    body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
            padding: containerCommonPadding,
            child: Column(
              children: [
                Container(
                  margin: containerMinMargin,
                ),

                GestureDetector(
                  child: SizedBox(
                    height: logoMinImageheight,
                    width: logoMinImageWidth,
                    child: Image.asset(
                      'images/ollin_transparent.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindLocation()),
                    );
                  },
                ),

                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Padding(
                      padding: buttonMinPadding,
                      child: Text(
                        'Assist Me',
                        style: TextStyle(fontSize: 24),
                      ),
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
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Padding(
                      padding: buttonMinPadding,
                      child: Text(
                        'Find My Location',
                        style: TextStyle(fontSize: 24.0),
                      ),
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

                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Padding(
                      padding: buttonMinPadding,
                      child: Text(
                        'Emergency Contacts',
                        style: TextStyle(fontSize: 24.0),
                      ),
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
                            builder: (context) => const ContactPage()),
                      );
                      _speak1();
                    },
                  ),
                )
              ],
            )),
      ]),
    ),
  );
}
