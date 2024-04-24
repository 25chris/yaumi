import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenIjinCutiViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final formKey = GlobalKey<FormState>();
  String? location = "";
  bool isLoading = false;

  DateTimeRange? dateRange;
  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: dateRange,
    );

    if (newDateRange != null) {
      dateRange = newDateRange;
      rebuildUi();
    }
  }

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

  void promptIjinDialog(
      {required String tanggal,
      required String alasanIjin,
      required String date,
      required String timestamp,
      required String lokasi,
      required int yaumiUserId}) {
    _dialogService.showCustomDialog(
        variant: DialogType.prompter,
        title: "Ijin Cuti Kerja Darurat $tanggal",
        description: "Submit cuti kerja dengan rincian: $alasanIjin",
        data: {
          "date": date,
          "timestamp": timestamp,
          "statusKehadiran": StatusKehadiran.ijin.name,
          "lokasi": lokasi,
          "yaumiUserId": yaumiUserId
        });
  }
}
