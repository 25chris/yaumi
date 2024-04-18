import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yaumi/blocs/bloc/absen_bloc.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/yaumi_temp.dart';
import 'package:yaumi/ui/views/absen_pulang/widgets/prompt_pulang.dart';

class CameraPulang extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final DateTime selectedDate;
  final Datum datum;
  const CameraPulang(
      {super.key,
      required this.selectedDate,
      required this.userAccount,
      required this.datum});

  @override
  State<CameraPulang> createState() => _CameraPulangState();
}

class _CameraPulangState extends State<CameraPulang> {
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

  Future<void> captureAndSaveImage(
      CameraController controller, Absen absen) async {
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

  var location = '';

  @override
  void initState() {
    HttpService().showAddress().then((value) => location = value);
    print('location is $location');
    super.initState();
  }

  @override
  void dispose() {
    initCamera().then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initCamera(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final controller = snapshot.data!;
            return BlocBuilder<AbsenBloc, AbsenState>(
              builder: (context, state) {
                final absen = state.allAbsen.firstWhere(
                    (element) => element.date == widget.selectedDate);
                return Scaffold(
                  body: imagePath == null
                      ? SizedBox(
                          child: CameraPreview(controller),
                        )
                      : PromptPulang(
                          userAccount: widget.userAccount,
                          imagePath: imagePath!,
                          selectedDate: widget.selectedDate,
                          absen: absen,
                          datum: widget.datum),
                  floatingActionButton: imagePath == null
                      ? Stack(
                          children: [
                            Positioned(
                              bottom: 25,
                              left: MediaQuery.of(context).size.width * .475,
                              child: FloatingActionButton(
                                onPressed: () async {
                                  try {
                                    await captureAndSaveImage(
                                        controller, absen);
                                    context.read<AbsenBloc>().add(UpdateAbsen(
                                        absen: absen.copyWith(
                                            selfieMasuk: imagePath)));
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')),
                                    );
                                  }
                                },
                                child: Icon(Icons.camera),
                              ),
                            )
                          ],
                        )
                      : null,
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
