import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class cameraScreen extends StatefulWidget {
  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<cameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController _controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      _controller = new CameraController(cameras[0], ResolutionPreset.ultraHigh);
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
