import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';

class YaumiViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  void showFardhuDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.fardhu,
        title: 'Shalat Fardhu',
        description: 'Shubuh');
  }

  void showTahajudDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.tahajud,
        title: 'Shalat Sunnah',
        description: 'Tahajud');
  }

  void showDhuhaDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.dhuha,
        title: 'Shalat Sunnah',
        description: 'Dhuha');
  }

  void showRawatibDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.rawatib,
        title: 'Shalat Sunnah',
        description: 'Rawatib');
  }

  void showTilawahDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.tilawah,
        title: "Tilawah Qur'an",
        description: '1 day 1 Juz');
  }

  void showShaumDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.shaum, title: "", description: '');
  }

  void showDzikirDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.dzikir, title: "", description: '');
  }

  void showTaklimrDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.taklim, title: "", description: '');
  }
}
