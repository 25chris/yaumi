import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/blocs/bloc/absen_bloc.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/ui/views/absen_pulang/absen_pulang_viewmodel.dart';
import 'package:yaumi/ui/views/absen_pulang/widgets/prompt_pulang.dart';

class CameraPulang extends StatefulWidget {
  final GoogleSignInAccount userAccount;
  final DateTime selectedDate;
  final Datum datum;
  final AbsenPulangViewModel viewModel;
  const CameraPulang(
      {super.key,
      required this.selectedDate,
      required this.userAccount,
      required this.datum,
      required this.viewModel});

  @override
  State<CameraPulang> createState() => _CameraPulangState();
}

class _CameraPulangState extends State<CameraPulang> {
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
                      : PromptPulang(
                          userAccount: widget.userAccount,
                          imagePath: widget.viewModel.imagePath!,
                          selectedDate: widget.selectedDate,
                          absen: absen,
                          datum: widget.datum,
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
                                    // ignore: use_build_context_synchronously
                                    context.read<AbsenBloc>().add(UpdateAbsen(
                                        absen: absen.copyWith(
                                            selfieMasuk:
                                                widget.viewModel.imagePath)));
                                  } catch (e) {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')),
                                    );
                                  }
                                },
                                child: const Icon(Icons.camera),
                              ),
                            )
                          ],
                        )
                      : null,
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
