import 'package:camera/camera.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenMasukViewModel extends BaseViewModel {
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

  void showAddress() {
    _httpService.showAddress().then((value) => location = value);
  }

  Future postAbsenMasuk(
      {required DateTime selectedDate,
      required GoogleSignInAccount userAccount,
      required Absen absen,
      required String lokasi,
      String? keterlambatan,
      required int yaumiUserId}) async {
    isLoading = true;
    rebuildUi();
    try {
      await _httpService.postAbsenMasukData(
          date: DateFormat("yyyy-MM-dd").format(selectedDate),
          timestamp: DateFormat("yyyy-MM-ddTHH:MM").format(DateTime.now()),
          jamMasuk: DateFormat("HH:mm:ss").format(DateTime.now()),
          pathToImage: absen.selfieMasuk,
          yaumiUser: yaumiUserId,
          statusKehadiran: StatusKehadiran.wfo.name,
          lokasi: lokasi,
          udzurKeterlambatan: keterlambatan,
          checkInDifference:
              checkInDifference(DateFormat("yyyy-MM-dd").format(selectedDate)));
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
}
