// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, avoid_print

import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'home1.dart';

FlutterTts flutterTts = FlutterTts();
 Future _speak2() async {
    await flutterTts.speak(
        'You have access the camera. Press the volume button to take a picture and detect objects around you');
  }
class cameraScreen extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() => _cameraScreenState();
}

class _cameraScreenState extends State<cameraScreen> {
  File? image;
  bool isReady = false;
  final imagePicker = ImagePicker();
  final _picker = ImagePicker();
  bool isimagepick = false;
  Future getImage() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedfile != null) {
      setState(() async {
        image = File(pickedfile.path);
        isimagepick = true;
        print(image);
         Future _speak2() async {
          await flutterTts.speak(
              'The Image has been captured. Wait for a while until ollin detects the object');
        }

        _speak2();
        print("object");
        Map<String, String> headers = {
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token'
        };

        final multipartRequest = http.MultipartRequest(
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
    getImage();
    _speak2();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
