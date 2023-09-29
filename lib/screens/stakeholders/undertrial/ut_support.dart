import 'package:flutter/material.dart';
import 'package:law_help/widgets/buttons/logout_button.dart';

class UTSupport extends StatelessWidget {
  const UTSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        child: LogoutButton(),
      ),
    );
  }
}
