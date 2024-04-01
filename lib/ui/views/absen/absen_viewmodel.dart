import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  bool isLoading = false;

  DateTime selectedDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

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
}
