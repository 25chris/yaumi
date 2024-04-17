import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/app/app.bottomsheets.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<void> toYaumi() async {
    _navigationService.navigateToYaumiView();
  }

  Future<void> toAbsen({required GoogleSignInAccount userAccount}) async {
    _navigationService.navigateToAbsenView(userAccount: userAccount);
  }

  Future<void> toGroups() async {
    _navigationService.navigateToGroupsView();
  }

  Future<void> toSettings({required GoogleSignInAccount? currentUser}) async {
    _navigationService.navigateToSettingsView(currentUser: currentUser);
  }
}
