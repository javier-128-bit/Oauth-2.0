import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _fireAuth = FirebaseAuth.instance;
final _googleSignIn = GoogleSignIn();

class Authprovider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  var isLogin = true;
  var enteredEmail = '';
  var enteredPassword = '';
  bool isLoading = false;

  voidSubmit() async {
    final _isvalid = form.currentState!.validate();
    if (!_isvalid) {
      return;
    }
    form.currentState!.save();

    try {
      if (isLogin) {
        final UserCredential = await _fireAuth.signInWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );
      } else {
        final UserCredential = await _fireAuth.createUserWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          print("Email sudah ada");
        }
      }
    }
  }

  // Tambahan method OAuth Google
  Future<void> signInWithGoogle() async {
    try {
      isLoading = true;
      notifyListeners();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // User cancel

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _fireAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print("Google Sign-In error: ${e.message}");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _fireAuth.signOut();
    await _googleSignIn.signOut();
  }
}
