import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/ui/common/login_api.dart';

class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  void showDialog({required GoogleSignInAccount currentUser}) {
    _dialogService.showCustomDialog(
        variant: DialogType.profileSettings,
        title: 'Stacked Rocks!',
        description: 'Teeeees',
        data: currentUser);
  }

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
