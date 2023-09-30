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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              _buildCard(context, 'Bail Generation System',
                  'Ease of bail generation for the  lawyers'),
              SizedBox(height: 20.0), // Add some spacing
              _buildCard(context, 'Vakalatnama Generator',
                  'Vakalatnama generation for start of case '),
              SizedBox(height: 20.0), // Add some spacing
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
    } else {
      // Handle other cards if needed
    }
  }

  Widget _buildCard(BuildContext context, String cardTitle, String subtitle) {
    return GestureDetector(
      onTap: () {
        _handleCardTap(context, cardTitle);
      },
      child: SizedBox(
        height: 200.0, // Set a fixed height for the cards
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  cardTitle,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
