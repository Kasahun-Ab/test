import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class AuthRepositoty {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<UserModel?> login(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user != null
        ? UserModel(
            uid: userCredential.user!.uid, email: userCredential.user!.email!)
        : null;
  }

  Future<UserModel?> register(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential.user != null
        ? UserModel(
            uid: userCredential.user!.uid, email: userCredential.user!.email!)
        : null;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  Future<UserModel?> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential? userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user != null
          ? UserModel(
              uid: userCredential.user!.uid,
              email: userCredential.user!.email!)
          : null;
    // ignore: empty_catches
    } catch (e) {
    }
    return null;
  }

  
  Stream get User => _firebaseAuth.authStateChanges();
}
