import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/models/yaumi.dart';

class YaumiViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  DateTime selectedDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void setDate(DateTime date) {
    selectedDateTime = date;
    rebuildUi();
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
      required double poin,
      required ShaumSunnah shaumSunnah,
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
          dzikirPoin,
          taklimPoin,
          istighfarPoin,
          shalawatPoin
        ].fold(0.0, (previousValue, element) => previousValue + element) /
        activedYaumi;

    //return
    return myTotalPoin.toStringAsFixed(2);
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
}
