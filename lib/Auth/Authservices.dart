import 'package:bmi_calculator/Auth/Authprovider.dart';
import 'package:bmi_calculator/Auth/firebaseAuthS.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservices implements AuthProviderT {
  AuthProviderT provider;
  Authservices(this.provider);

  factory Authservices.fromfirebase() => Authservices(firebaseAuthP());

  @override
  Future<void> initializeApp() => provider.initializeApp();

  @override
  Future<void> logout() => provider.logout();

  @override
  Future<UserCredential?> signIn(
          {required String email, required String password}) =>
      provider.signIn(email: email, password: password);

  @override
  Future<UserCredential?> signInWithGoggle() => provider.signInWithGoggle();

  @override
  Future<UserCredential?> signup(
          {required String email, required String password}) =>
      provider.signup(email: email, password: password);
}
