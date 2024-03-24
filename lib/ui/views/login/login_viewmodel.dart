import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _googleSignIn = GoogleSignIn();
  bool isLoading = false;

  Future<void> toHome() async {
    isLoading = true;
    rebuildUi();
    await Future.delayed(const Duration(seconds: 3));
    GoogleSignInAccount? currentUser = _googleSignIn.currentUser;
    currentUser ??= await _googleSignIn.signInSilently();
    if (currentUser != null) {
      _navigationService.replaceWithHomeView(currentUser: currentUser);
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
