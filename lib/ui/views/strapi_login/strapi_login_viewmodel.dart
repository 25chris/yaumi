import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/ui/common/login_api.dart';

class StrapiLoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool isLoading = false;
  Future toLogin() async {
    isLoading = true;
    rebuildUi();
    await Future.delayed(const Duration(seconds: 3));
    try {
      await LoginApi.signOut;
      _navigationService.replaceWithLoginView();
    } catch (e) {
      return;
    }
  }
}
