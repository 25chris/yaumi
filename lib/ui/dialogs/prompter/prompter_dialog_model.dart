import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/services/http_service.dart';

class PrompterDialogModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _navigationService = locator<NavigationService>();

  bool isLoading = false;
  Future<void> postCutiKerjaDarurat(
      {required String date,
      required String timestamp,
      required String lokasi,
      required GoogleSignInAccount userAccount,
      required int yaumiUser}) async {
    isLoading = true;
    rebuildUi();
    try {
      await _httpService.postCutiKerja(
          date: date,
          timestamp: timestamp,
          statusKehadiran: StatusKehadiran.ijin.name,
          lokasi: lokasi,
          yaumiUser: yaumiUser);
      _navigationService.replaceWithAbsenView(userAccount: userAccount);
    } catch (e) {
      isLoading = false;
      rebuildUi();
    }
  }
}
