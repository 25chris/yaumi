import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/services/http_service.dart';

class AbsenDetailViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  bool isLoading = false;

  Future putKeterlambatan() async {}
  Future replaceWithAbsenView() async {}
}
