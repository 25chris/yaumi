import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/models/strapi/absen_strapi.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  bool isLoading = false;

  List<Color> tepatWaktyGradient = [
    const Color.fromARGB(255, 10, 123, 215),
    const Color.fromARGB(255, 127, 196, 252)
  ];
  List<Color> terlambatGradient = [
    const Color.fromARGB(255, 215, 10, 10),
    const Color.fromARGB(255, 252, 127, 127)
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

  //submitAbsen
  void submitPulang() async {
    isLoading = true;
    rebuildUi();

    await _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: "Chekcout jam kerja?",
        description: "Apakah hari ini anda bekerja overtime?");

    isLoading = false;
    rebuildUi();
    return;
  }

  //UpdateAbsen
  void updateAbsen() async {
    return;
  }

  //==============control function

  //==============NAVIGATION===================
  Future<void> toAbsenMasuk(
      {required DateTime selectedDatetime,
      required GoogleSignInAccount userAccount}) async {
    _navigationService.navigateToAbsenMasukView(
        selectedDate: selectedDatetime, userAccount: userAccount);
  }

  Future<void> toAbsenPulang(
      {required DateTime selectedDatetime,
      required GoogleSignInAccount userAccount,
      required Datum datum}) async {
    _navigationService.navigateToAbsenPulangView(
        selectedDate: selectedDatetime, userAccount: userAccount, datum: datum);
  }

  Future<void> toAbsenIjinCuti(
      {required GoogleSignInAccount userAccount}) async {
    _navigationService.navigateToAbsenIjinCutiView(
        isEmergency: false,
        selectedDateTime: selectedDateTime,
        userAccount: userAccount);
  }

  Future<void> toAbsenIjinCutiDarurat(
      {required GoogleSignInAccount userAccount}) async {
    _navigationService.navigateToAbsenIjinCutiView(
        isEmergency: true,
        selectedDateTime: selectedDateTime,
        userAccount: userAccount);
  }

  Future replaceToAbsenView({required GoogleSignInAccount userAccount}) async {
    _navigationService.replaceWithAbsenView(userAccount: userAccount);
  }

  Future toAbsenDetailView(
      {required Datum datum,
      required bool isDetailMasuk,
      required GoogleSignInAccount userAccount}) async {
    _navigationService.navigateToAbsenDetailView(
        datum: datum, isDetailMasuk: isDetailMasuk, userAccount: userAccount);
  }
}
