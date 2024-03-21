import 'package:google_sign_in/google_sign_in.dart';

class LoginApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future signOut = _googleSignIn.signOut();

  static Future<bool?> checkSignInStatus() async {
    try {
      // Attempt to get the currently authenticated user
      GoogleSignInAccount? currentUser = _googleSignIn.currentUser;
      if (currentUser == null) {
        // Attempt to sign in the user without user interaction
        currentUser = await _googleSignIn.signInSilently();
      }

      if (currentUser != null) {
        // User is signed in; navigate to a different screen
        return true;
      } else {
        // User is not signed in; navigate to sign in screen
        return false;
      }
    } catch (error) {
      print(error); // Handle the error as appropriate in your app
    }
  }
}
