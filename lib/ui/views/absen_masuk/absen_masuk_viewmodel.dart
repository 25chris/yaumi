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
      required int yaumiUserId}) async {
    isLoading = true;
    rebuildUi();
    try {
      await _httpService.postAbsenMasukData(
          date: DateFormat("yyyy-MM-dd").format(selectedDate),
          timestamp: DateFormat("yyyy-MM-ddTHH:MM").format(DateTime.now()),
          jamMasuk: DateFormat("hh:mm:ss").format(DateTime.now()),
          pathToImage: absen.selfieMasuk,
          yaumiUser: yaumiUserId);
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
