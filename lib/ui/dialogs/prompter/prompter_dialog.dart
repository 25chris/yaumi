import 'package:flutter/material.dart';
import 'package:yaumi/ui/common/app_colors.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'prompter_dialog_model.dart';

const double _graphicSize = 60;

class PrompterDialog extends StackedView<PrompterDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const PrompterDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PrompterDialogModel viewModel,
    Widget? child,
  ) {
    return viewModel.isLoading
        ? Center(
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: Colors.black,
            ),
          )
        : Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              request.title ?? 'Hello Stacked Dialog!!',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            if (request.description != null) ...[
                              verticalSpaceTiny,
                              Text(
                                request.description!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kcMediumGrey,
                                ),
                                maxLines: 3,
                                softWrap: true,
                              ),
                            ],
                          ],
                        ),
                      ),
                      Container(
                        width: _graphicSize,
                        height: _graphicSize,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF6E7B0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_graphicSize / 2),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text('⭐️', style: TextStyle(fontSize: 30)),
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () async {
                            await viewModel.postCutiKerjaDarurat(
                                completer: completer,
                                date: request.data['date'],
                                selectedDate: request.data['selectedDate'],
                                timestamp: request.data['timestamp'],
                                lokasi: request.data['lokasi'],
                                userAccount: request.data['userAccount'],
                                yaumiUser: request.data['yaumiUserId'],
                                alasanIjin: request.data['alasanIjin'],
                                tanggalMulaiIjin:
                                    request.data['tanggalMulaiIjin'],
                                tanggalAkhirIjin:
                                    request.data['tanggalAkhirIjin']);
                          },
                          icon: Icon(Icons.thumb_up_alt),
                          label: Text("Iya")),
                      TextButton.icon(
                          onPressed: () =>
                              completer(DialogResponse(confirmed: true)),
                          icon: Icon(Icons.cancel),
                          label: Text("Tidak")),
                    ],
                  )
                ],
              ),
            ),
          );
  }

  @override
  PrompterDialogModel viewModelBuilder(BuildContext context) =>
      PrompterDialogModel();
}
