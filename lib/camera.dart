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
    return new MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
