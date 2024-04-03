import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  bool isLoading = false;

  List<Color> tepatWaktyGradient = [
    Color.fromARGB(255, 10, 123, 215),
    Color.fromARGB(255, 127, 196, 252)
  ];
  List<Color> terlambatGradient = [
    Color.fromARGB(255, 215, 10, 10),
    Color.fromARGB(255, 252, 127, 127)
  ];

  DateTime selectedDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void selectDate({required DateTime date}) {
    selectedDateTime = date;
    rebuildUi();
  }

  //submitAbsen
  void submitAbsen() async {
    isLoading = true;
    rebuildUi();

    await _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: "Absen Kerja Tersimpan",
        description: "Keterangan absen");

    isLoading = false;
    rebuildUi();
    return;
  }

  //UpdateAbsen
  void updateAbsen() async {
    return;
  }

  //==============NAVIGATION===================
  Future<void> toAbsenSelfie() async {
    _navigationService.navigateToAbsenSelfieView();
  }
}
