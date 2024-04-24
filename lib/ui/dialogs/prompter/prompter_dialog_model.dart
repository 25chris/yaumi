import 'package:stacked/stacked.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/models/absen.dart';
import 'package:yaumi/services/http_service.dart';

class PrompterDialogModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  Future<void> postCutiKerjaDarurat(
      {required String date,
      required String timestamp,
      required String lokasi,
      required int yaumiUser}) async {
    await _httpService.postCutiKerja(
        date: date,
        timestamp: timestamp,
        statusKehadiran: StatusKehadiran.ijin.name,
        lokasi: lokasi,
        yaumiUser: yaumiUser);
  }
}
