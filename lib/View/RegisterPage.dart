// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Auth/Authservices.dart';
import 'package:bmi_calculator/Auth/firebaseAuthS.dart';
import 'package:bmi_calculator/View/LoginPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final Authservices authservices = Authservices(firebaseAuthP());
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your email here '),
              autofocus: true,
              controller: _email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              autocorrect: false,
              obscureText: true,
              decoration:
                  const InputDecoration(hintText: 'Enter your password here '),
              controller: _password,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () async {
                final user = await authservices.signup(
                    email: _email.text, password: _password.text);
                if (!mounted) return;
                print(user);
                if (user != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                }
              },
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account ?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  },
                  child: const Text('Sign in'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
