import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:ollin/contacts.dart';
import 'package:ollin/find_location.dart';

import 'home1.dart';

FlutterTts flutterTts = FlutterTts();

// class cameraScreen extends StatefulWidget {
//   @override
//   CameraState createState() => CameraState();
// }

// class CameraState extends State<cameraScreen> {
//   Future _speak() async {
//     await flutterTts.speak(
//         'Your camera is open, Press the volume button to take a picture and detect objects around you');
//   }

//   Future _tell() async {
//     await flutterTts.speak('A picture has been taken ');
//   }

//   late List<CameraDescription> cameras;
//   late CameraController _controller;

//   bool isReady = false;

//   final imagePicker = ImagePicker();
//   File? image;
//   bool isimagepick = false;

//   final _picker = ImagePicker();
//   Future getimage() async {
//     final pickedfile = await _picker.pickImage(source: ImageSource.camera);
//     if (pickedfile != null) {
//       setState(() async {
//         image = File(pickedfile.path);
//         isimagepick = true;
//         print(image);
//         print("object");
//         Map<String, String> headers = {
//           'Accept': 'application/json',
//           // 'Authorization': 'Bearer $token'
//         };

//         final multipartRequest = new http.MultipartRequest(
//             "POST", Uri.parse("https://ollin.azurewebsites.net/ollin"));
//         multipartRequest.headers.addAll(headers);

//         multipartRequest.fields.addAll({
//           // "user_id": Usererdatalist.userid,
//           // "blog_title": titlecontroller.text,
//           // "blog_description": descontroller.text,
//           // "blog_file": docFile.toString(),
//         });

//         multipartRequest.files.add(await http.MultipartFile.fromPath(
//           'image',
//           image!.path,
//         ));
//         http.StreamedResponse response = await multipartRequest.send();

//         var responseString = await response.stream.bytesToString();
//         print(response);
//         print(responseString);
//         Future _speak1() async {
//           await flutterTts.speak(responseString);
//         }

//         _speak1();

//         //  var responseString = String.fromCharCodes(responseString.toString());

//         // print(response.toString());

//         if (response.statusCode == 200) {
//           setState(() {
//             image == null;
//           });

//           // print(responseString);
//         } else {}
//       });
//     } else {
//       print("Not any image is selected");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     setupCameras();
//     getimage();
//     _speak();
//   }

//   Future<void> setupCameras() async {
//     try {
//       cameras = await availableCameras();
//       _controller =
//           new CameraController(cameras[0], ResolutionPreset.ultraHigh);
//       await _controller.initialize();
//     } on CameraException catch (E) {
//       setState(() {
//         isReady = false;
//       });
//     }
//     setState(() {
//       isReady = true;
//     });
//   }

//   Widget build(BuildContext context) {
//     if (!isReady && !_controller.value.isInitialized) {
//       return Container();
//     }
//     return AspectRatio(
//         aspectRatio: _controller.value.aspectRatio,
//         child: CameraPreview(_controller));
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ollin/contacts.dart';
// import 'package:ollin/find_location.dart';

// import 'home1.dart';

// void main() => runApp(new cameraScreen());

class cameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _cameraScreenState();
}

class _cameraScreenState extends State<cameraScreen> {
  File? image;
  bool isReady = false;
  final imagePicker = ImagePicker();
  final _picker = ImagePicker();
  bool isimagepick = false;
  Future getImage() async {
    // var image = await ImagePicker.pickImage(source: ImageSource.camera);
    // setState(() {});
    final pickedfile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedfile != null) {
      setState(() async {
        image = File(pickedfile.path);
        isimagepick = true;
        print(image);
        print("object");
        Map<String, String> headers = {
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token'
        };

        final multipartRequest = new http.MultipartRequest(
            "POST", Uri.parse("https://ollin.azurewebsites.net/ollin"));
        multipartRequest.headers.addAll(headers);

        multipartRequest.fields.addAll({
          // "user_id": Usererdatalist.userid,
          // "blog_title": titlecontroller.text,
          // "blog_description": descontroller.text,
          // "blog_file": docFile.toString(),
        });

        multipartRequest.files.add(await http.MultipartFile.fromPath(
          'image',
          image!.path,
        ));
        http.StreamedResponse response = await multipartRequest.send();

        var responseString = await response.stream.bytesToString();
        print(response);
        print(responseString);
        Future _speak1() async {
          await flutterTts.speak(responseString);
        }

        _speak1();

        //  var responseString = String.fromCharCodes(responseString.toString());

        // print(response.toString());

        if (response.statusCode == 200) {
          setState(() {
            image == null;
          });

          // print(responseString);
        } else {}
      });
    } else {
      print("Not any image is selected");
    }
  }

  @override
  void initState() {
    super.initState();
    // setupCameras();
    getImage();
    // _speak();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
         debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Color(0xFFDEDCD2),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                //  Padding(padding: EdgeInsets.only(left: 20,right: 20)),
                padding: containerCommonPadding,
                child: Column(
                  children: [
                    Container(
                      margin: containerMaxMargin,
                    ),

                    GestureDetector(
                      child: Container(
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
                      //  margin: const EdgeInsets.only(top: 90.0),

                      //   child: Center(
                      //     child: Image.asset('images/ollin_transparent.png'),

                      //   ),
                    ),

                    SizedBox(height: 50),
                    //         InkWell(
                    // onTap: () {

                    // }, // Handle your callback.
                    // splashColor: Color(0xFFDEDCD2),

//   child: Ink(

//     height: 200,
//     width: 200,
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage('images/ollin_transparent.png'),
//         fit: BoxFit.cover,
//       ),
//     ),
//   ),
// ),

                    // height: 111,
                    // width: 448,
                    // margin: EdgeInsets.only(
                    //     top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF014268)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cameraScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    // height: 111,
                    // width: 448,
                    // margin: EdgeInsets.only(
                    //     top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),

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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF9C866F)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    // height: 111,
                    // width: 448,
                    // margin: EdgeInsets.only(
                    //     top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFE7301C)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        },
                      ),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }

  Widget _screenSmaller(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDCD2),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              //  Padding(padding: EdgeInsets.only(left: 20,right: 20)),
              padding: containerCommonPadding,
              child: Column(
                children: [
                  Container(
                    margin: containerMinMargin,
                  ),

                  GestureDetector(
                    child: Container(
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
                    //  margin: const EdgeInsets.only(top: 90.0),

                    //   child: Center(
                    //     child: Image.asset('images/ollin_transparent.png'),

                    //   ),
                  ),

                  SizedBox(height: 30),
                  //         InkWell(
                  // onTap: () {

                  // }, // Handle your callback.
                  // splashColor: Color(0xFFDEDCD2),

//   child: Ink(

//     height: 200,
//     width: 200,
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage('images/ollin_transparent.png'),
//         fit: BoxFit.cover,
//       ),
//     ),
//   ),
// ),

                  // height: 111,
                  // width: 448,
                  // margin: EdgeInsets.only(
                  //     top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cameraScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  // height: 111,
                  // width: 448,
                  // margin: EdgeInsets.only(
                  //     top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),

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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  // height: 111,
                  // width: 448,
                  // margin: EdgeInsets.only(
                  //     top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      },
                    ),
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
