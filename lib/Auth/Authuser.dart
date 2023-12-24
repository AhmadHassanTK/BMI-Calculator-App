import 'package:firebase_auth/firebase_auth.dart';

class Authuser {
  final String id;
  final String email;
  final bool isverified;
  final String weight;
  final String height;

  const Authuser({
    required this.email,
    required this.isverified,
    required this.id,
    required this.weight,
    required this.height,
  });

  factory Authuser.fromfirebase(User user) => Authuser(
        email: user.email!,
        isverified: user.emailVerified,
        id: user.uid,
        weight: "0",
        height: "0",
      );
}
