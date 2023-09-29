import 'package:flutter/material.dart';
import 'package:law_help/widgets/buttons/logout_button.dart';

class LawyerDocument extends StatelessWidget {
  const LawyerDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Generation'),
      ),
      body: LogoutButton(
        
      ),
    );
  }
}
