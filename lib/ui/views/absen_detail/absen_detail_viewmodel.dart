import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenDetailViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  bool isLoading = false;

  Future putKeterlambatan(
      {required int id,
      required String keterlambatan,
      required GoogleSignInAccount userAccount}) async {
    isLoading = true;
    rebuildUi();
    try {
      await _httpService.putAlasanKeterlambatan(
          id: id, keterlambatan: keterlambatan);
      isLoading = false;
      rebuildUi();
      _navigationService.replaceWithAbsenView(userAccount: userAccount);
    } catch (e) {
      isLoading = false;
      rebuildUi();
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Gagal input data",
          description:
              "Data keterlambatan gagal diinput, cek koneksi internet anda lalu coba beberapa saat lagi.");
    }
  }

  Future putPulangAwal({required int id, required String pulangAwal}) async {
    isLoading = true;
    rebuildUi();
    try {
      await _httpService.putAlasanKeterlambatan(
          id: id, keterlambatan: pulangAwal);
      isLoading = false;
      rebuildUi();
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Data Masuk",
          description: "Data pulangAwal berhasil diinput, terima kasih.");
    } catch (e) {
      isLoading = false;
      rebuildUi();
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Gagal input data",
          description:
              "Data pulangAwal gagal diinput, cek koneksi internet anda lalu coba beberapa saat lagi.");
    }
  }

  Future replaceWithAbsenView() async {}

  void calculateDuration(String date, String jamMasuk, String jamPulang) {
    try {
      // Split date and time strings into components
      List<String> dateParts = date.split('-');
      List<String> jamMasukParts = jamMasuk.split(':');
      List<String> jamPulangParts = jamPulang.split(':');

      // Manually create DateTime objects, ensuring to remove any non-numeric characters from day part
      DateTime startTime = DateTime(
          int.parse(dateParts[0]),
          int.parse(dateParts[1]),
          int.parse(
              dateParts[2].split(' ')[0]), // Ensure only the day part is taken
          int.parse(jamMasukParts[0]),
          int.parse(jamMasukParts[1]),
          int.parse(jamMasukParts[2].split('.')[0]));

      DateTime endTime = DateTime(
          int.parse(dateParts[0]),
          int.parse(dateParts[1]),
          int.parse(
              dateParts[2].split(' ')[0]), // Ensure only the day part is taken
          int.parse(jamPulangParts[0]),
          int.parse(jamPulangParts[1]),
          int.parse(jamPulangParts[2].split('.')[0]));

      // Calculate the difference
      Duration duration = endTime.difference(startTime);
      int minutes = duration.inMinutes;

      // Debug outputs
      print("Duration: $minutes minutes");
      print("StartTime: $startTime");
      print("EndTime: $endTime");
      print("Duration in detail: $duration");
    } catch (e) {
      print("Error during parsing or calculation: $e");
    }
  }

  int checkInDifference(String date) {
    // Manually parse the date and jamMasuk to avoid locale/formatting issues
    List<String> dateParts = date.split('-');

    // Ensure only the day part is taken, avoiding any parsing of unintended characters
    int day = int.parse(dateParts[2].split(' ')[0]);

    // Construct DateTime objects for jamMasuk and the target time of 08:15
    DateTime jamMasukTime = DateTime.now();
    DateTime targetDateTime = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        day,
        8, // Hour for 08:15
        15, // Minute for 08:15
        0 // Second for 08:15
        );

    // Calculate the difference
    Duration duration = targetDateTime.difference(jamMasukTime);

    // Debug prints to trace computation
    print("Debug Info:");
    print("Parsed JamMasuk Time: $jamMasukTime");
    print("Parsed Target Time (08:15): $targetDateTime");
    print("Calculated Duration: ${duration.inMinutes} minutes");

    // Return the difference in minutes
    return duration.inMinutes;
  }

  int checkOutDifference(String date, String jamPulang) {
    // Manually parse the date and jamPulang to avoid locale/formatting issues
    List<String> dateParts = date.split('-');
    List<String> timeParts = jamPulang.split(':');

    // Ensure only the day part is taken, avoiding any parsing of unintended characters
    int day = int.parse(dateParts[2].split(' ')[0]);

    // Construct DateTime objects for jamPulang and the target time of 16:00
    DateTime jamPulangTime = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        day,
        int.parse(timeParts[0]),
        int.parse(timeParts[1]),
        int.parse(timeParts[2].split('.')[0]));
    DateTime targetDateTime = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        day,
        16, // Hour for 16:00
        0, // Minute for 16:00
        0 // Second for 16:00
        );

    // Calculate the difference
    Duration duration = jamPulangTime.difference(targetDateTime);

    // Debug prints to trace computation
    print("Debug Info:");
    print("Parsed JamPulang Time: $jamPulangTime");
    print("Parsed Target Time (16:00): $targetDateTime");
    print("Calculated Duration: ${duration.inMinutes} minutes");

    // Return the difference in minutes, negated to align with the requirement
    return duration.inMinutes;
  }
}
