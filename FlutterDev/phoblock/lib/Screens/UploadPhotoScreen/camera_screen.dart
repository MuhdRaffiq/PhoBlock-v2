import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'PreviewPostScreen/preview_post_screen.dart';
import 'PreviewScreen/preview_screen.dart';
import 'Gallery/gallery_screen.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class CameraScreen extends StatefulWidget {
  final int userId;

  CameraScreen({this.userId});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

  Future<void> getImage(context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPostScreen(image, widget.userId),
      ),
    );
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.ultraHigh);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  //Display camera preview
  Widget _cameraPreviewWidget() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  //Display the control bar with buttons to take pictures
  Widget _cameraControlWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            FloatingActionButton(
              child: Icon(Icons.circle, color: Colors.black45),
              backgroundColor: Colors.white,
              onPressed: () {
                _onCapturePressed(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  //Display a row of toggle to select the camera
  Widget _cameraToggleRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
          onPressed: _onSwitchCamera,
          icon: Icon(
            _getCameraLensIcon(lensDirection),
            color: Colors.white,
            size: 32,
          ),
          label: Text(
            '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  //Display a row of showing phone gallery
  Widget _navigateGallery(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton.icon(
          onPressed: () {
            //navigate to preview screen
            getImage(context);
          },
          icon: Icon(
            Icons.collections_rounded,
            color: Colors.white,
            size: 32,
          ),
          label: Text(''),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print('No cameras available');
      }
    }).catchError((err) {
      print('Error : ${err.code}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: _cameraPreviewWidget(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90,
                  width: double.infinity,
                  //padding: EdgeInsets.all(15),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _cameraToggleRowWidget(),
                      _cameraControlWidget(context),
                      _navigateGallery(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error : ${e.code}\n Error message: ${e.description}';

    print(errorText);
  }

  Future<void> _onCapturePressed(context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      await cameraController.takePicture();

      //navigate to preview screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            imgPath: path,
          ),
        ),
      );
    } catch (e) {
      print(e);
      //_showCameraException(e);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;

    CameraDescription selectedCamera = cameras[selectedCameraIndex];

    _initCameraController(selectedCamera);
  }

  IconData _getCameraLensIcon(CameraLensDirection lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
      default:
        return Icons.device_unknown;
    }
  }
}
