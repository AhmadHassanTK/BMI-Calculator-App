// import 'package:flutter/material.dart';

// class MyDropDown extends StatefulWidget {
//   MyDropDown({Key? key, required String dropdownValue}) : super(key: key);
//   String? dropdownValue;
//   @override
//   _DropdownListTutorialState createState() => _DropdownListTutorialState();
// }

// class _DropdownListTutorialState extends State<MyDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: widget.dropdownValue,
//       hint: Text('Select your gender'),
//       icon: const Icon(Icons.arrow_drop_down),
//       onChanged: (String? newValue) {
//         setState(() {
//           widget.dropdownValue = newValue!;
//         });
//       },
//       items: <String>['Red', 'Green', 'Blue']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
