// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cardScreens/vakNam.dart';
import 'cardScreens/pray.dart';
import 'cardScreens/bailApp.dart';
import '../../login/login_method.dart';

class LawyerDocument extends StatelessWidget {
  LawyerDocument({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _logout(BuildContext context) async {
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
    prefs.remove('email');
    prefs.remove('caseNumber');
    prefs.remove('isLoggedIn');

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Generation'),
        actions: [
          IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: _buildCard(context, 'Bail Generation System')),
                  Expanded(child: _buildCard(context, 'Vakalatnama Generator')),
                ],
              ),
              SizedBox(height: 20.0), // Add some spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: _buildCard(context, 'Prayer Generator')),
                  Expanded(child: _buildCard(context, 'Card 4')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCardTap(BuildContext context, String cardTitle) {
    if (cardTitle == 'Bail Generation System') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BailGenerationPage()),
      );
    } else if (cardTitle == 'Vakalatnama Generator') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VakalatnamaGeneratorPage()),
      );
    } else if (cardTitle == 'Prayer Generator') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PrayerGeneratorPage()),
      );
    } else {
      // Handle other cards if needed
    }
  }

  Widget _buildCard(BuildContext context, String cardTitle) {
    return GestureDetector(
      onTap: () {
        _handleCardTap(context, cardTitle);
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                cardTitle,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text('Card content goes here'),
            ],
          ),
        ),
      ),
    );
  }
}
