import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LawyerManageCases extends StatefulWidget {
  const LawyerManageCases({Key? key}) : super(key: key);

  @override
  _LawyerManageCasesState createState() => _LawyerManageCasesState();
}

class _LawyerManageCasesState extends State<LawyerManageCases> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _caseIdController = TextEditingController();
  final TextEditingController _dateOfFilingController = TextEditingController();
  final TextEditingController _completedHearingsController = TextEditingController();
  final TextEditingController _adjournmentsController = TextEditingController();
  final TextEditingController _advocatesController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ))!;
    if (picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateOfFilingController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitCase() async {
    if (_formKey.currentState!.validate()) {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final String lawyerId = user.uid;
        final String caseId = _caseIdController.text.trim();
        final String dateOfFiling = _dateOfFilingController.text.trim();
        int completedHearings = int.tryParse(_completedHearingsController.text) ?? 0;
        int adjournments = int.tryParse(_adjournmentsController.text) ?? 0;
        int advocates = int.tryParse(_advocatesController.text) ?? 0;

        try {
          final DocumentSnapshot userData = await FirebaseFirestore.instance
              .collection('users')
              .doc(lawyerId)
              .get();
          final String lawyerName = userData['name'];

          await FirebaseFirestore.instance.collection('cases').add({
            'lawyerName': lawyerName,
            'lawyerId': lawyerId,
            'caseId': caseId,
            'dateOfFiling': dateOfFiling,
            'completedHearings': completedHearings,
            'adjournments': adjournments,
            'advocates': advocates,
          });

          _caseIdController.clear();
          _dateOfFilingController.clear();
          _completedHearingsController.clear();
          _adjournmentsController.clear();
          _advocatesController.clear();
        } catch (error) {
          print(error.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Manage Cases',
          style: TextStyle(
            fontFamily: 'Pacifico',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _caseIdController,
                decoration: InputDecoration(labelText: 'Case ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the case ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateOfFilingController,
                    decoration: InputDecoration(
                      labelText: 'Date of Filing',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select the date of filing';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _completedHearingsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Completed Hearings'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of completed hearings';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _adjournmentsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Adjournments'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of adjournments';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _advocatesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Advocates'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of advocates';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitCase,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
