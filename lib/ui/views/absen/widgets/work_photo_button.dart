import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'dart:async';
import 'dart:io';

class WorkPhotoButtons extends StatefulWidget {
  const WorkPhotoButtons({super.key});

  @override
  State<WorkPhotoButtons> createState() => _WorkPhotoButtonsState();
}

class _WorkPhotoButtonsState extends State<WorkPhotoButtons> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  // Initializing the front camera
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final frontCam = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );
    _controller = CameraController(frontCam, ResolutionPreset.medium);
    _initializeControllerFuture = _controller?.initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceSmall,
        Text(
          "Masuk kerja 07.30, kepulangan 16.30",
          style: TextStyle(fontSize: 13, color: Colors.blueGrey[600]),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for "Photo Masuk Kerja" function
                initCamera();
                print('Photo Masuk Kerja button pressed');
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Selfie Masuk'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for "Pulang Kerja" function
                print('Pulang Kerja button pressed');
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Selfie Pulang'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> captureImage() async {
    try {
      // Take the picture in a try / catch block. If anything goes wrong,
      // catch the error.
      final XFile? image = await _controller?.takePicture();

      // If the picture was taken, display it on a new screen.
      if (image != null) {
        // At this point, you have the image file which you can use
        // for uploading or other purposes. The image file path is accessible
        // via image.path

        // For example, to show the image in the UI, you could navigate to another
        // screen and pass the image path.
        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => DisplayPictureScreen(imagePath: image.path)));

        // Or save the image to the device's gallery or a specific directory
        final String imagePath = image.path;
        // Implement saving functionality here

        print('Picture saved to $imagePath');
      }
    } catch (e) {
      // If an error occurs, log the error (and maybe set some state)
      print(e);
    }
  }
}
