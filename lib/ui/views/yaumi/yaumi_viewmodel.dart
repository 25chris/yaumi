import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/blocs/bloc/yaumi_bloc.dart';
import 'package:yaumi/models/yaumi.dart';
import 'package:yaumi/services/http_service.dart';

class YaumiViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  bool isLoading = false;

  DateTime selectedDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  Future<void> toYaumiLog() async {
    _navigationService.navigateToYaumiLogView();
  }

  void submitYaumi(
      {required BuildContext context,
      required String email,
      required Yaumi yaumi,
      required String todayPoin}) async {
    isLoading = true;
    rebuildUi();

    context
        .read<YaumiBloc>()
        .add(UpdateYaumi(yaumi: yaumi.copyWith(poin: double.parse(todayPoin))));

    try {
      await submitYaumiData(
          email: email,
          date: DateFormat("yyyy-MM-dd").format(yaumi.date),
          poin: double.parse(todayPoin),
          shubuh: yaumi.shubuh,
          dhuhur: yaumi.dhuhur,
          ashar: yaumi.ashar,
          maghrib: yaumi.maghrib,
          isya: yaumi.isya,
          tahajud: yaumi.tahajud,
          dhuha: yaumi.dhuha,
          qshubuh: yaumi.qshubuh,
          qdhuhur: yaumi.qdhuhur,
          bdhuhur: yaumi.bdhuhur,
          bmaghrib: yaumi.bmaghrib,
          bisya: yaumi.bisya,
          tilawah: yaumi.tilawah,
          shaumSunnah: yaumi.shaumSunnah,
          sedekah: yaumi.sedekah,
          dzikirPagi: yaumi.dzikirPagi,
          dzikirPetang: yaumi.dzikirPetang,
          taklim: yaumi.taklim,
          istighfar: yaumi.istighfar,
          shalawat: yaumi.shalawat);

      isLoading = false;
      rebuildUi();
    } catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Yaumi Tidak Bisa Disimpan",
          description:
              "Periksa koneksi internet anda, lalu coba beberapa saat lagi");
      isLoading = false;
      rebuildUi();
    }
  }

  void updateYaumi(
      {required BuildContext context,
      required String id,
      required Yaumi yaumi,
      required String todayPoin}) async {
    isLoading = true;
    rebuildUi();

    context
        .read<YaumiBloc>()
        .add(UpdateYaumi(yaumi: yaumi.copyWith(poin: double.parse(todayPoin))));

    try {
      HttpService().putYaumi(
          id: id,
          poin: double.parse(todayPoin),
          shubuh: yaumi.shubuh,
          dhuhur: yaumi.dhuhur,
          ashar: yaumi.ashar,
          maghrib: yaumi.maghrib,
          isya: yaumi.isya,
          tahajud: yaumi.tahajud,
          dhuha: yaumi.dhuha,
          qshubuh: yaumi.qshubuh,
          qdhuhur: yaumi.qdhuhur,
          bdhuhur: yaumi.bdhuhur,
          bmaghrib: yaumi.bmaghrib,
          bisya: yaumi.bisya,
          tilawah: yaumi.tilawah,
          shaumSunnah: yaumi.shaumSunnah.name,
          sedekah: yaumi.sedekah,
          dzikirPagi: yaumi.dzikirPagi,
          dzikirPetang: yaumi.dzikirPetang,
          taklim: yaumi.taklim.name,
          istighfar: yaumi.istighfar,
          shalawat: yaumi.shalawat);

      isLoading = false;
      rebuildUi();
    } catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Yaumi Tidak Bisa Disimpan",
          description:
              "Periksa koneksi internet anda, lalu coba beberapa saat lagi");
      isLoading = false;
      rebuildUi();
    }
  }

  void setDate(DateTime date) {
    selectedDateTime = date;
    rebuildUi();
  }

  void checkUser({required String email}) {
    _httpService.checkUserRegistration(email: email);
  }

  String totalPoin(
      {required bool shubuh,
      required bool dhuhur,
      required bool ashar,
      required bool maghrib,
      required bool isya,
      required int tahajud,
      required int dhuha,
      required bool qshubuh,
      required bool qdhuhur,
      required bool bdhuhur,
      required bool bmaghrib,
      required bool bisya,
      required int tilawah,
      required ShaumSunnah shaumSunnah,
      required bool sedekah,
      required bool dzikirPagi,
      required bool dzikirPetang,
      required Taklim taklim,
      required bool istighfar,
      required bool shalawat,
      required int activedYaumi}) {
    //fardhu
    double fardhuPoin = [
      shubuh,
      dhuhur,
      ashar,
      maghrib,
      isya,
    ]
        .fold(0, (previousValue, element) => previousValue + (element ? 20 : 0))
        .toDouble();

    //tahajud
    double tahajudPoin =
        double.parse(((tahajud / 11) * 100).toStringAsFixed(2));

    //dhuha
    double dhuhaPoin = double.parse(((dhuha / 12) * 100).toStringAsFixed(2));

    //rawatib
    double rawatibPoin = [
      qshubuh,
      qdhuhur,
      bdhuhur,
      bmaghrib,
      bisya,
    ].fold(0, (previousValue, element) => previousValue + (element ? 20 : 0));

    //tilawah
    double tilawahPoin =
        double.parse(((tilawah / 20) * 100).toStringAsFixed(2));

    //shaum
    double shaumPoin = shaumSunnah != ShaumSunnah.tidakShaum ? 100.0 : 0.0;

    //sedekah
    double sedekahPoin = sedekah ? 100.0 : 0.0;

    //dzikir
    double dzikirPoin = [
      dzikirPagi,
      dzikirPetang,
    ].fold(0, (previousValue, element) => previousValue + (element ? 50 : 0));

    //taklim
    double taklimPoin = taklim != Taklim.tidakTaklim ? 100.0 : 0.0;

    //istighfar
    double istighfarPoin = istighfar ? 100 : 0;

    //shalawat
    double shalawatPoin = shalawat ? 100 : 0;

    double? myTotalPoin = [
          fardhuPoin,
          tahajudPoin,
          dhuhaPoin,
          rawatibPoin,
          tilawahPoin,
          shaumPoin,
          sedekahPoin,
          dzikirPoin,
          taklimPoin,
          istighfarPoin,
          shalawatPoin
        ].fold(0.0, (previousValue, element) => previousValue + element) /
        activedYaumi;

    //return
    return myTotalPoin.toStringAsFixed(2);
  }

  Future<void> submitYaumiData(
      {required String email,
      required String date,
      required double poin,
      required bool shubuh,
      required bool dhuhur,
      required bool ashar,
      required bool maghrib,
      required bool isya,
      required int tahajud,
      required int dhuha,
      required bool qshubuh,
      required bool qdhuhur,
      required bool bdhuhur,
      required bool bmaghrib,
      required bool bisya,
      required int tilawah,
      required ShaumSunnah shaumSunnah,
      required bool sedekah,
      required bool dzikirPagi,
      required bool dzikirPetang,
      required Taklim taklim,
      required bool istighfar,
      required bool shalawat}) async {
    try {
      return await _httpService.postYaumi(
          email: email,
          date: date,
          shubuh: shubuh,
          dhuhur: dhuhur,
          ashar: ashar,
          maghrib: maghrib,
          isya: isya,
          tahajud: tahajud,
          dhuha: dhuha,
          qshubuh: qshubuh,
          qdhuhur: qdhuhur,
          bdhuhur: bdhuhur,
          bmaghrib: bmaghrib,
          bisya: bisya,
          tilawah: tilawah,
          poin: poin,
          shaumSunnah: shaumSunnah.name,
          sedekah: sedekah,
          dzikirPagi: dzikirPagi,
          dzikirPetang: dzikirPetang,
          taklim: taklim.name,
          istighfar: istighfar,
          shalawat: shalawat);
    } catch (e) {
      print('error');
    }
  }

  void showFardhuDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.fardhu,
        title: 'Shalat Fardhu',
        description: 'Shubuh',
        data: selectedDateTime);
  }

  void showTahajudDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.tahajud,
        title: 'Shalat Sunnah',
        description: 'Tahajud',
        data: selectedDateTime);
  }

  void showDhuhaDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.dhuha,
        title: 'Shalat Sunnah',
        description: 'Dhuha',
        data: selectedDateTime);
  }

  void showRawatibDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.rawatib,
        title: 'Shalat Sunnah',
        description: 'Rawatib',
        data: selectedDateTime);
  }

  void showTilawahDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.tilawah,
        title: "Tilawah Qur'an",
        description: '1 day 1 Juz',
        data: selectedDateTime);
  }

  void showShaumDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.shaum,
        title: "",
        description: '',
        data: selectedDateTime);
  }

  void showDzikirDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.dzikir,
        title: "",
        description: '',
        data: selectedDateTime);
  }

  void showTaklimrDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.taklim,
        title: "",
        description: '',
        data: selectedDateTime);
  }

  // Adjusted function to also return the previous period's percentage
  Map<String, double> calculateAndComparePercentage(
      List<Yaumi> allYaumis, double maxPointsPerPeriod) {
    // Initialize the map to store the sum of points for each period
    Map<String, double> periodSums = {};

    // Calculate today's date and determine the current and previous period keys
    DateTime today = DateTime.now();
    String currentPeriodKey = getPeriodKey(today);
    String previousPeriodKey = getPreviousPeriodKey(today);

    // Initialize sums for current and previous periods
    periodSums[currentPeriodKey] = 0.0;
    periodSums[previousPeriodKey] = 0.0;

    // Iterate through all Yaumi instances to sum up points for the current and previous periods
    for (var yaumi in allYaumis) {
      String yaumiPeriodKey = getPeriodKey(yaumi.date);

      if (yaumiPeriodKey == currentPeriodKey ||
          yaumiPeriodKey == previousPeriodKey) {
        periodSums[yaumiPeriodKey] = periodSums[yaumiPeriodKey]! + yaumi.poin;
      }
    }

    // Calculate the percentages for the current and previous periods
    Map<String, double> periodPercentages = {
      'currentPeriod':
          (periodSums[currentPeriodKey]! / maxPointsPerPeriod) * 100,
      'previousPeriod':
          (periodSums[previousPeriodKey]! / maxPointsPerPeriod) * 100,
    };

    return periodPercentages;
  }

  String getPeriodKey(DateTime date) {
    // If the date is from the 11th onwards, the period starts in the current month
    if (date.day >= 11) {
      return "${date.year}-${date.month}-11 to ${date.year}-${date.month + 1}-10";
    } else {
      // If the date is before the 11th, the period started in the previous month
      int previousMonth = date.month - 1;
      int year = date.year;
      // Handle January (month 1) wrapping to December of the previous year
      if (previousMonth == 0) {
        previousMonth = 12;
        year--;
      }
      return "${year}-${previousMonth}-11 to ${date.year}-${date.month}-10";
    }
  }

  String getPreviousPeriodKey(DateTime date) {
    // Calculate the start date of the current period
    DateTime startDateOfCurrentPeriod;
    if (date.day >= 11) {
      startDateOfCurrentPeriod = DateTime(date.year, date.month, 11);
    } else {
      startDateOfCurrentPeriod = DateTime(date.year, date.month - 1, 11);
    }

    // Calculate the start date of the previous period by subtracting one month
    DateTime startDateOfPreviousPeriod = DateTime(
        startDateOfCurrentPeriod.year, startDateOfCurrentPeriod.month - 1, 11);

    // Generate the period key for the previous period
    return getPeriodKey(startDateOfPreviousPeriod);
  }
}
