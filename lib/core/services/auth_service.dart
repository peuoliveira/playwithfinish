import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:logger/logger.dart';
// TODO(Peu):
class AuthService {
  static final Logger _logger = Logger();

  static Future<User?> signInWithGoogle() async {
    if (!kIsWeb) {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn(
          // TODO(Peu):
          // clientId:
          //     '933170289622-jsfb3f1efp54goaq1e9410optkqkc94u.apps.googleusercontent.com.apps.googleusercontent.com',
        ).signIn();
        if (googleUser == null) {
          return null;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      } catch (error) {
        _logger.e('Erro ao fazer login com o Google: $error');
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      _logger.e('Erro ao fazer logout: $error');
    }
  }

  static User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
