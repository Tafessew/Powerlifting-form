// part8.dart
// Wada Tafesse
// 4.11.2025
// Descritipon; App that collects data of powerlifters to sign up for a meet.
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

// === MAIN APP ===
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
  final _nameController = TextEditingController();
  String _selectedGender = 'Male';
  String _selectedWeightClass = '74kg';
  String _selectedDivision = 'Raw';
  Powerlifter? _submittedLifter;

  List<String> genders = ['Male', 'Female'];
  List<String> weightClasses = [
    '59kg',
    '66kg',
    '74kg',
    '83kg',
    '93kg',
    '105kg',
    '120kg',
    '120+kg',
  ];
  List<String> division = ['Raw', 'Equipped'];
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
              items:
                  genders.map((gender) {
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
              items:
                  weightClasses.map((wc) {
                    return DropdownMenuItem(value: wc, child: Text(wc));
                  }).toList(),
            ),
            // Widget 3: Division Class Dropdown
            DropdownButton<String>(
              value: _selectedDivision,
              onChanged: (value) {
                setState(() {
                  _selectedDivision = value!;
                });
              },
              items:
                  division.map((wc) {
                    return DropdownMenuItem(value: wc, child: Text(wc));
                  }).toList(),
            ),

            // Widget 4: Submit Button
            ElevatedButton(onPressed: _submitForm, child: Text('Register')),

            // Widget 5: Confirmation Text
            if (_submittedLifter != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Registered: ${_submittedLifter!.name}, ${_submittedLifter!.gender}, ${_submittedLifter!.weightClass},${_submittedLifter!.division}',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
