// Filename: main.dart
// Date: April 25, 2025
// Author: Wada Tafesse
// Description: A Flutter app for powerlifting competition registration. It allows users to enter name, gender, weight class, and division, then shows confirmation.

// === IMPORTS ===
import 'package:flutter/material.dart';

// === MODEL ===
class Powerlifter {
  String name;
  String gender;
  String weightClass;
  String division;

  Powerlifter({
    required this.name,
    required this.gender,
    required this.weightClass,
    required this.division,
  });
}

// === MAIN APP START ===
void main() {
  runApp(PowerliftingApp());
}

// === VIEW & CONTROLLER ===
class PowerliftingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Powerlifting Registration',
      home: PowerliftingForm(),
    );
  }
}

class PowerliftingForm extends StatefulWidget {
  @override
  _PowerliftingFormState createState() => _PowerliftingFormState();
}

class _PowerliftingFormState extends State<PowerliftingForm> {
  final _nameController = TextEditingController(); // Controls the name input

  // Default selected values
  String _selectedGender = 'Male';
  String _selectedWeightClass = '74kg';
  String _selectedDivision = 'Raw';

  Powerlifter? _submittedLifter; // Stores the lifter after form submission

  // Dropdown options
  List<String> genders = ['Male', 'Female'];
  List<String> weightClasses = [
    '59kg', '66kg', '74kg', '83kg', '93kg', '105kg', '120kg', '120+kg'
  ];
  List<String> division = ['Raw', 'Equipped'];

  // Function to handle form submission
  void _submitForm() {
    setState(() {
      _submittedLifter = Powerlifter(
        name: _nameController.text,
        gender: _selectedGender,
        weightClass: _selectedWeightClass,
        division: _selectedDivision,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Powerlifting Form')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Widget 1: Name Input
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),

            // Widget 2: Gender Dropdown
            DropdownButton<String>(
              value: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
              items: genders.map((gender) {
                return DropdownMenuItem(value: gender, child: Text(gender));
              }).toList(),
            ),

            // Widget 3: Weight Class Dropdown
            DropdownButton<String>(
              value: _selectedWeightClass,
              onChanged: (value) {
                setState(() {
                  _selectedWeightClass = value!;
                });
              },
              items: weightClasses.map((wc) {
                return DropdownMenuItem(value: wc, child: Text(wc));
              }).toList(),
            ),

            // Widget 4: Division Dropdown
            DropdownButton<String>(
              value: _selectedDivision,
              onChanged: (value) {
                setState(() {
                  _selectedDivision = value!;
                });
              },
              items: division.map((div) {
                return DropdownMenuItem(value: div, child: Text(div));
              }).toList(),
            ),

            // Widget 5: Submit Button
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Register'),
            ),

            // Widget 6: Confirmation Text
            if (_submittedLifter != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Registered: ${_submittedLifter!.name}, ${_submittedLifter!.gender}, ${_submittedLifter!.weightClass}, ${_submittedLifter!.division}',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
