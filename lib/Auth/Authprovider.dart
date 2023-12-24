import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthProviderT {
  Future<UserCredential?> signIn(
      {required String email, required String password});

  Future<UserCredential?> signup(
      {required String email, required String password});

  Future<UserCredential?> signInWithGoggle();

  Future<void> logout();

  Future<void> initializeApp();
}
