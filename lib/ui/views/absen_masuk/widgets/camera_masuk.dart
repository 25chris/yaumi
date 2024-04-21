import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/blocs/bloc/absen_bloc.dart';
import 'package:yaumi/ui/views/absen_masuk/absen_masuk_viewmodel.dart';
import 'package:yaumi/ui/views/absen_masuk/widgets/prompt_masuk.dart';

class CameraMasuk extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final DateTime selectedDate;
  final AbsenMasukViewModel viewModel;
  const CameraMasuk(
      {super.key,
      required this.selectedDate,
      required this.userAccount,
      required this.viewModel});

  @override
  State<CameraMasuk> createState() => _CameraMasukState();
}

class _CameraMasukState extends State<CameraMasuk> {
  @override
  void initState() {
    widget.viewModel.showAddress();
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.initCamera().then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.initCamera(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final controller = snapshot.data!;
            return BlocBuilder<AbsenBloc, AbsenState>(
              builder: (context, state) {
                final absen = state.allAbsen.firstWhere(
                    (element) => element.date == widget.selectedDate);
                return Scaffold(
                  body: widget.viewModel.imagePath == null
                      ? SizedBox(
                          child: CameraPreview(controller),
                        )
                      : PromptMasuk(
                          userAccount: widget.userAccount,
                          imagePath: widget.viewModel.imagePath!,
                          selectedDate: widget.selectedDate,
                          absen: absen,
                          viewModel: widget.viewModel,
                        ),
                  floatingActionButton: widget.viewModel.imagePath == null
                      ? Stack(
                          children: [
                            Positioned(
                              bottom: 25,
                              left: MediaQuery.of(context).size.width * .475,
                              child: FloatingActionButton(
                                onPressed: () async {
                                  try {
                                    await widget.viewModel
                                        .captureAndSaveImage(controller, absen);
                                    context.read<AbsenBloc>().add(UpdateAbsen(
                                        absen: absen.copyWith(
                                            selfieMasuk:
                                                widget.viewModel.imagePath)));
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
