// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/View/MainPage.dart';
import 'package:flutter/material.dart';

class Calculation extends StatelessWidget {
  final String userheight;
  final String userweight;
  Calculation({super.key, required this.userheight, required this.userweight});

  String BMIcategory(double BMI) {
    if (BMI < 18.5) {
      return 'Underweight';
    } else if (18.5 <= BMI && BMI < 24.9) {
      return 'Healthy Weight';
    } else if (25 <= BMI && BMI < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  double BMIcalculate(int height, int weight) {
    final x = (height / 100) * (height / 100);
    final BMI = weight / x;
    return BMI;
  }

  @override
  Widget build(BuildContext context) {
    final BMI = BMIcalculate(int.parse(userheight), int.parse(userweight));
    final cat = BMIcategory(BMI);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Results',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                  Card(
                      color: Colors.grey.shade100,
                      child: ListTile(
                        title: Text(
                          'BMI ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('${BMI} kg/m2'),
                        leading: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset('assets/bmi.png'),
                        ),
                      )),
                  Card(
                    color: Colors.grey.shade100,
                    child: ListTile(
                      title: Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(cat),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/$cat.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: () async {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (route) => false);
            },
            child: Text(
              'Back',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
