import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:yaumi/blocs/bloc/absen_bloc.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/yaumi_temp.dart';
import 'package:yaumi/ui/views/absen_selfie/widgets/absen_keluar_prompt.dart';
import 'package:yaumi/ui/views/absen_selfie/widgets/absen_masuk_prompt.dart';

class AbsenSelfieMain extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final DateTime selectedDate;
  final bool isCheckIn;
  Datum? datum;
  AbsenSelfieMain(
      {super.key,
      required this.selectedDate,
      required this.userAccount,
      this.datum,
      this.isCheckIn = false});

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

    context
        .read<AbsenBloc>()
        .add(UpdateAbsen(absen: absen.copyWith(selfieMasuk: filePath)));

    setState(() {
      imagePath = filePath;
      imageFilePath = filePath;
    });
  }

  var location;

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
    return FutureBuilder<CameraController>(
      future: initCamera(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final controller = snapshot.data!;
          return BlocBuilder<AbsenBloc, AbsenState>(
            builder: (context, state) {
              final absen = state.allAbsen
                  .firstWhere((element) => element.date == widget.selectedDate);
              return Scaffold(
                body: imagePath == null
                    ? SizedBox(
                        child: CameraPreview(controller),
                      )
                    : widget.isCheckIn
                        ? AbsenMasukPrompt(
                            userAccount: widget.userAccount,
                            imagePath: imagePath,
                            absen: absen,
                            selectedDate: widget.selectedDate)
                        : AbsenKeluarPrompt(
                            userAccount: widget.userAccount,
                            imagePath: imagePath,
                            absen: absen,
                            datum: widget.datum!,
                            selectedDate: widget.selectedDate),
                floatingActionButton: imagePath == null
                    ? Stack(
                        children: [
                          Positioned(
                            bottom: 25,
                            left: MediaQuery.of(context).size.width * .475,
                            child: FloatingActionButton(
                              onPressed: () async {
                                try {
                                  await captureAndSaveImage(controller, absen);
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
      },
    );
  }
}
