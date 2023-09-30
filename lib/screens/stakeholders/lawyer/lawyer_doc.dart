import 'package:flutter/material.dart';
import 'package:law_help/widgets/buttons/logout_button.dart';

class LawyerDocument extends StatelessWidget {
  const LawyerDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Generation'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Handle logout button pressed
            },
            icon: Icon(Icons.logout),
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
                  Expanded(child: _buildCard('Card 1')),
                  Expanded(child: _buildCard('Card 2')),
                ],
              ),
              SizedBox(height: 20.0), // Add some spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: _buildCard('Card 3')),
                  Expanded(child: _buildCard('Card 4')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String cardTitle) {
    return Card(
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
    );
  }
}
