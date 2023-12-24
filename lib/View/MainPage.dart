// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bmi_calculator/Shared/MyTextField.dart';
import 'package:bmi_calculator/View/Calculation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _age = TextEditingController();

  @override
  void dispose() {
    _height.dispose();
    _weight.dispose();
    _age.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Main Page',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color: Colors.black),
                ),
                const SizedBox(height: 30),
                MyTextField(
                  controller: _age,
                  autofocusflag: false,
                  hintValue: 'Enter your age',
                  textInputType: TextInputType.number,
                  isObscureText: false,
                  icon: Icon(Icons.add_circle_outline_sharp),
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: _height,
                  autofocusflag: false,
                  hintValue: 'Enter your height',
                  textInputType: TextInputType.number,
                  isObscureText: false,
                  icon: Icon(Icons.add_circle_outline_sharp),
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: _weight,
                  autofocusflag: false,
                  hintValue: 'Enter your weight',
                  textInputType: TextInputType.number,
                  isObscureText: false,
                  icon: Icon(Icons.add_circle_outline_sharp),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_height.text.isNotEmpty && _weight.text.isNotEmpty) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            // settings: RouteSettings(arguments: ),
                            builder: (context) => Calculation(
                              userheight: _height.text,
                              userweight: _weight.text,
                            ),
                          ),
                          (route) => false);
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
