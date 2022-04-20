import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'home1.dart';

FlutterTts flutterTts = FlutterTts();

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
