import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

FlutterTts flutterTts = FlutterTts();

class cameraScreen extends StatefulWidget {
  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<cameraScreen> {
  Future _speak() async {
    await flutterTts
        .speak('Your camera is open, Press the volume button to take a picture and detect objects around you');
  }
    Future _tell() async {
    await flutterTts
        .speak('A picture has been taken ');
  }

  late List<CameraDescription> cameras;
  late CameraController _controller;
  bool isReady = false;
  late File _image;

  final imagePicker = ImagePicker();
  Future getImage() async {
    // ignore: deprecated_member_use
    //final image = await imagePicker.getImage(source: ImageSource.camera);
    // setState(() {
    //   _image = File(image!.path);
    // });
    // GallerySaver.saveImage(_image.path).then((path) {
    //   setState(() {
    //      _image = File(image!.path);
    //   });
    // });
    // if (image !=null)
    // // ignore: curly_braces_in_flow_control_structures
    // Image.network(

    //   image.path,
    //   height: 200,

    // );  

    var image = await ImagePicker().getImage(source: ImageSource.camera);
          _tell();

    if (image == null) {
      return;
    } else {
      GallerySaver.saveImage(image.path);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    setupCameras();
    getImage();
    _speak();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      _controller =
          new CameraController(cameras[0], ResolutionPreset.ultraHigh);
      await _controller.initialize();
    } on CameraException catch (E) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }

  Widget build(BuildContext context) {
    if (!isReady && !_controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller));
  }
}
