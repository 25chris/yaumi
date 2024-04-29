import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yaumi/app/app.dialogs.dart';
import 'package:yaumi/app/app.locator.dart';

class LoginApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future signOut = _googleSignIn.signOut();

  final _dialogService = locator<DialogService>();

  Future<bool?> checkSignInStatus() async {
    try {
      // Attempt to get the currently authenticated user
      GoogleSignInAccount? currentUser = _googleSignIn.currentUser;
      currentUser ??= await _googleSignIn.signInSilently();

      if (currentUser != null) {
        // User is signed in; navigate to a different screen
        return true;
      } else {
        // User is not signed in; navigate to sign in screen
        return false;
      }
    } catch (error) {
      _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: "Error",
          description: "Terjadi error: $error");
    }
    return null;
  }
}
