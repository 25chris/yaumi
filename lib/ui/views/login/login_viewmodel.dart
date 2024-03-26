import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.locator.dart';
import 'package:yaumi/app/app.router.dart';
import 'package:yaumi/services/http_service.dart';

class LoginViewModel extends BaseViewModel {
  final _httpService = locator<HttpService>();
  final _navigationService = locator<NavigationService>();
  final _googleSignIn = GoogleSignIn();
  bool isLoading = false;

  Future<void> login() async {
    isLoading = true;
    rebuildUi();
    await Future.delayed(const Duration(seconds: 3));
    GoogleSignInAccount? currentUser = _googleSignIn.currentUser;
    currentUser ??= await _googleSignIn.signInSilently();

    if (currentUser != null) {
      try {
        final users =
            await _httpService.getYaumiUser(); // Assuming this returns a Future
        final userExists = users?.data?.any((element) =>
                element.attributes?.email?.contains(currentUser!.email) ??
                false) ??
            false;

        if (userExists) {
          _navigationService.replaceWithHomeView(currentUser: currentUser);
        } else {
          await _httpService.registerToStrapi(
              nama: currentUser.displayName!,
              email: currentUser.email,
              uid: currentUser.id,
              namaGroup: '',
              gid: '');
          _navigationService.replaceWithHomeView(currentUser: currentUser);
        }
      } catch (e) {
        // Handle error, maybe navigate to an error view?
        print("Error fetching users: $e");
        _navigationService.replaceWithLoginView();
      }
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
