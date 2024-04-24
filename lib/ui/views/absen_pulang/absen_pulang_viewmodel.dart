import 'package:camera/camera.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenPulangViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  bool isLoading = false;
  String? imagePath;
  var location = '';

  Future<CameraController> initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    final controller = CameraController(
      frontCamera,
      ResolutionPreset.high,
    );

    await controller.initialize();
    return controller;
  }

  Future<void> captureAndSaveImage(
      CameraController controller, Absen absen) async {
    if (!controller.value.isInitialized) {
      throw Exception('Camera is not initialized');
    }

    final directory = await getApplicationDocumentsDirectory();
    final fileName = '${DateTime.now()}.jpg';
    final filePath = join(directory.path, fileName);

    final image = await controller.takePicture();
    await image.saveTo(filePath);
    imagePath = filePath;
    rebuildUi();
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

  Future<void> showAddress() async {
    await _httpService.showAddress().then((value) => location = value);
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

  int calculateDuration(String date, String jamMasuk, String jamPulang) {
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
      return duration.inMinutes;
    } catch (e) {
      print("Error during parsing or calculation: $e");
      return 0;
    }
  }

  Future putAbsenKeluar(
      {required String pathToImage,
      required int id,
      required String date,
      required String jamMasuk,
      required String jamPulang,
      String? pulangLebihAwal,
      required GoogleSignInAccount userAccount}) async {
    isLoading = true;
    rebuildUi();
    try {
      await _httpService.putAbsenKeluarData(
          id: id,
          pathToImage: pathToImage,
          pulangLebihAwal: pulangLebihAwal,
          calculateDuration: calculateDuration(date, jamMasuk, jamPulang),
          calculateOvertime: checkOutDifference(date, jamPulang));
      isLoading = false;
      _navigationService.replaceWithAbsenView(userAccount: userAccount);
    } catch (e) {
      isLoading = false;
      rebuildUi();
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Absen Gagal Tercatat",
          description:
              "Periksa koneksi internet anda & coba lagi setelah beberapa saat!! Error: $e");
    }
  }
}
