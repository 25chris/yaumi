import 'package:stacked/stacked.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/ui/common/login_api.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithLoginView();
    // var user = await LoginApi.login();
    // if (user != null) {
    //   _navigationService.replaceWithHomeView();
    // } else {

    // }

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
  }
}
