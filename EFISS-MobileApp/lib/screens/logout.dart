import 'package:flutter/material.dart';
import 'package:survillience_screens/widgets/logout.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: logoutWidgets(),
      ),
    );
  }
}
