// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenIjinCutiViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  String? location = "";
  bool isLoading = false;
  final loaFormKey = GlobalKey<FormState>();
  DateTimeRange? newDateRange;

  Future<void> fetchAdreess() async {
    isLoading = true;
    rebuildUi();
    try {
      await _httpService.showAddress().then((value) => location = value);
      isLoading = false;
      rebuildUi();
    } catch (e) {
      isLoading = false;
      rebuildUi();
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Lokasi gagal didapatkan",
          description:
              "Silahkan cek koneksi internet dan GSP anda, lalu coba beberapa saat lagi.");
    }
  }

  Future<void> promptIjinDialog(
      {required String alasanIjin,
      required String date,
      required String timestamp,
      required String lokasi,
      required GoogleSignInAccount userAccount,
      required DateTime selectedDate,
      required int yaumiUserId}) async {
    try {
      await _dialogService.showCustomDialog(
          variant: DialogType.prompter,
          title:
              "Rincian Cuti ${DateFormat("dd MMM yy").format(newDateRange!.start)} - ${DateFormat("dd MMM yy").format(newDateRange!.end)}",
          description: "Submit cuti kerja dengan rincian: $alasanIjin",
          data: {
            "date": date,
            "timestamp": timestamp,
            "statusKehadiran": StatusKehadiran.ijin.name,
            "lokasi": lokasi,
            "userAccount": userAccount,
            "yaumiUserId": yaumiUserId,
            "alasanIjin": alasanIjin,
            "tanggalMulaiIjin":
                DateFormat("yyyy-MM-dd").format(newDateRange!.start),
            "tanggalAkhirIjin":
                DateFormat("yyyy-MM-dd").format(newDateRange!.end),
            "selectedDate": selectedDate
          });
      _navigationService.replaceWithAbsenView(userAccount: userAccount);
    } catch (e) {
      return;
    }
  }

  //===LOA_FORM

  Future<void> selectDateRange(BuildContext context) async {
    while (true) {
      // Loop to allow re-selection if needed
      DateTimeRange? pickedRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDateRange: newDateRange,
      );

      if (pickedRange != null) {
        newDateRange = pickedRange; // Update with the newly picked range
        break; // Exit the loop as a valid range has been picked or edited
      } else {
        // Show dialog to enforce selection or allow cancellation
        bool shouldContinue = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Selection Required'),
                content: const Text('You must select a date range to proceed.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('OK'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ) ??
            false; // Default to false if null

        if (!shouldContinue) break; // Exit if the user chooses to cancel
      }
    }
    rebuildUi();
  }

  Future<void> submitForm(
      {required BuildContext context,
      required TextEditingController ijinCutiController,
      required String date,
      required DateTime selectedDate,
      required GoogleSignInAccount userAccount,
      required int yaumiUser}) async {
    if (loaFormKey.currentState!.validate()) {
      if (newDateRange != null) {
        FocusScope.of(context).requestFocus(FocusNode());
        promptIjinDialog(
            alasanIjin: ijinCutiController.text,
            date: date,
            timestamp: DateTime.now().toString(),
            lokasi: location!,
            userAccount: userAccount,
            selectedDate: selectedDate,
            yaumiUserId: 7);
      } else {
        await selectDateRange(context);
      }
    }
  }
}
