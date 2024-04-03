import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:yaumi/blocs/bloc/absen_bloc.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/common/yaumi_temp.dart';

class AbsenSelfieMain extends StatefulWidget {
  const AbsenSelfieMain({super.key});

  @override
  State<AbsenSelfieMain> createState() => _AbsenSelfieMainState();
}

class _AbsenSelfieMainState extends State<AbsenSelfieMain> {
  Future<CameraController> initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    final controller = CameraController(
      frontCamera,
      ResolutionPreset.high,
    );

    await controller.initialize();
    return controller;
  }

  String? imagePath; // Path of the captured image

  Future<void> captureAndSaveImage(CameraController controller) async {
    if (!controller.value.isInitialized) {
      throw Exception('Camera is not initialized');
    }

    final directory = await getApplicationDocumentsDirectory();
    final fileName = '${DateTime.now()}.jpg';
    final filePath = join(directory.path, fileName);

    final image = await controller.takePicture();
    await image.saveTo(filePath);

    setState(() {
      imagePath = filePath;
      imageFilePath = filePath;
    });
  }

  @override
  void dispose() {
    initCamera().then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CameraController>(
      future: initCamera(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final controller = snapshot.data!;
          return SafeArea(
            child: Scaffold(
              body: imagePath == null
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(controller),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("Nama Lengkap"),
                              verticalSpaceSmall,
                              Text("email.mail@gmail.com"),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .50,
                            height: MediaQuery.of(context).size.height * .50,
                            child: Image.file(
                              File(imagePath!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: [
                              Text("Jam Masuk"),
                              verticalSpaceSmall,
                              Text("08:58:56"),
                              verticalSpaceSmall,
                              Text("Gegerkalong Girang Baru, Bandung"),
                              verticalSpaceSmall,
                              Text("Lokasi tidak tepat?  Perbaharui lokasi"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text("SUBMIT")),
                            ),
                          )
                        ],
                      ),
                    ),
              floatingActionButton: imagePath == null
                  ? FloatingActionButton(
                      onPressed: () async {
                        try {
                          await captureAndSaveImage(controller);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        }
                      },
                      child: Icon(Icons.camera),
                    )
                  : null,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
