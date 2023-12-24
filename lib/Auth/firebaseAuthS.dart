import 'package:bmi_calculator/Auth/Authprovider.dart';
import 'package:bmi_calculator/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class firebaseAuthP implements AuthProviderT {
  @override
  Future<UserCredential?> signup(
      {required String email, required String password}) async {
    try {
      final userdata = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userdata;
    } catch (e) {
      throw FirebaseAuthException;
    }
  }

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    try {
      final userdata = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userdata;
    } catch (e) {
      throw FirebaseAuthException;
    }
  }

  @override
  Future<UserCredential?> signInWithGoggle() {
    // TODO: implement SignInWithGoggle
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw FirebaseAuthException;
    }
  }

  @override
  Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
