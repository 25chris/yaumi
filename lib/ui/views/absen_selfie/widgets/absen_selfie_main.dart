import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:yaumi/blocs/bloc/absen_bloc.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/common/yaumi_temp.dart';

class AbsenSelfieMain extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final DateTime selectedDate;
  const AbsenSelfieMain(
      {super.key, required this.selectedDate, required this.userAccount});

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
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                verticalSpaceLarge,
                                Text(
                                  widget.userAccount.displayName!,
                                  style: ktsBodyRegular.copyWith(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Poppins"),
                                ),
                                verticalSpaceTiny,
                                Text(widget.userAccount.email,
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 13,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins")),
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
                                Text("Jam Masuk",
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 13,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins")),
                                verticalSpaceSmall,
                                Text("08:58:56",
                                    style: ktsBodyRegular.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Poppins")),
                                verticalSpaceSmall,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.pin_drop),
                                        Flexible(
                                          child: Text(
                                              "Gegerkalong Girang Baru, Bandung",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: ktsBodyRegular.copyWith(
                                                  fontSize: 13,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins")),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                verticalSpaceSmall,
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Lokasi tidak tepat? ",
                                      style: ktsBodyRegular.copyWith(
                                          fontSize: 13,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins")),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => print('object'),
                                      text: "Perbaharui lokasi",
                                      style: ktsBodyRegular.copyWith(
                                          fontSize: 13,
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins"))
                                ])),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton.icon(
                                    icon: Icon(Icons.login),
                                    onPressed: () {},
                                    label: Text("Catat Jam Masuk")),
                              ),
                            )
                          ],
                        ),
                      ),
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
