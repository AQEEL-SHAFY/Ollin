// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '';
import 'google_map.dart';

FlutterTts flutterTts = FlutterTts();

class FindLocation extends StatefulWidget {
  const FindLocation({Key? key}) : super(key: key);

  @override
  State<FindLocation> createState() => _FindLocationState();
}

class _FindLocationState extends State<FindLocation> {
  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.speak('You can find the location here');
    }

    _speak();
    return Scaffold(
        backgroundColor: Color(0xFFDEDCD2),
      body: SingleChildScrollView(
        
        child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: <Widget>[
              Container(
                // margin:
                padding: EdgeInsets.only(left: 20,right: 20),
                // const EdgeInsets.only(top: 30.0, left: 20.0, right: 0.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CurrentLocationScreen(),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
              //   height: 72,
              //   width: 309,
              //   child: ElevatedButton(
              //     child: Text(
              //       'Tell My Location',
              //       style: TextStyle(fontSize: 24.0),
              //     ),
              //     style: ButtonStyle(
              //       backgroundColor:
              //           MaterialStateProperty.all<Color>(Color(0xFF014268)),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //       )),
              //     ),
              //     onPressed: () {

              //     },
              //   ),
              // ),
              // Container(
              //   margin:
              //   const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
              //   height: 72,
              //   width: 309,
              //   child: ElevatedButton(
              //     child: Text(
              //       'Emergency Contact',
              //       style: TextStyle(fontSize: 24.0),
              //     ),
              //     style: ButtonStyle(
              //       backgroundColor:
              //       MaterialStateProperty.all<Color>(Color(0xFFE7301C)),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(25.0),
              //           )),
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const EmergencyContactWidget()),
              //       );
              //     },
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
              //   height: 72,
              //   width: 309,
              //   child: ElevatedButton(
              //     child: Text(
              //       'Back To Home',
              //       style: TextStyle(fontSize: 24.0),
              //     ),
              //     style: ButtonStyle(
              //       backgroundColor:
              //           MaterialStateProperty.all<Color>(Color(0xFF9B9A93)),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //       )),
              //     ),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              // ),
            ]),
      ),
    );
  }
}
