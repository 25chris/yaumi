// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenSakitViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  DateTimeRange? newDateRange;
  File? suratSakitImage;

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

  Future<void> submitIjinSakit(
      {required String ijinSakit,
      required BuildContext context,
      required String date,
      required String namaPenyakit,
      required GoogleSignInAccount userAccount,
      required int yaumiUser}) async {
    if (formKey.currentState!.validate()) {
      if (newDateRange != null) {
        FocusScope.of(context).requestFocus(FocusNode());
        isLoading = true;
        rebuildUi();
        try {
          await _httpService.postIjinSakit(
              date: date,
              namaPenyakit: namaPenyakit,
              tanggalMulaiIjin:
                  DateFormat("yyyy-MM-dd").format(newDateRange!.start),
              tanggalAkhirIjin:
                  DateFormat("yyyy-MM-dd").format(newDateRange!.end),
              yaumiUser: yaumiUser);
          _navigationService.replaceWithAbsenView(userAccount: userAccount);
        } catch (e) {
          isLoading = false;
          rebuildUi();
          _dialogService.showCustomDialog(
              variant: DialogType.infoAlert,
              title: "Ijin Sakit Gagal Submit",
              description:
                  "Cek koneksi internet anda, lalu coba beberapa saat lagi. Jika masalah masih berlanjut, hubungi bagian administrasi.");
        }
      } else {
        await selectDateRange(context);
      }
    }
  }
}
