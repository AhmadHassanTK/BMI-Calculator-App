// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Auth/Authservices.dart';
import 'package:bmi_calculator/Auth/firebaseAuthS.dart';
import 'package:bmi_calculator/View/MainPage.dart';
import 'package:bmi_calculator/View/RegisterPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final Authservices authservices = Authservices(firebaseAuthP());

  @override
  void initState() {
    Authservices.fromfirebase().initializeApp();
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontStyle: FontStyle.italic),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  autocorrect: false,
                  decoration:
                      const InputDecoration(hintText: "Enter your email here "),
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Enter your password here "),
                  controller: _password,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    final user = await authservices.signIn(
                        email: _email.text, password: _password.text);

                    print(user);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                        (route) => false);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You need to sign up ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                            (route) => false);
                      },
                      child: Text(
                        'Sign up',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
