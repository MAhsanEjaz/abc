import 'package:abc_cash_and_carry/utils/get_strings.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(GetStrings.getString('')),
          ],
        ),
      ),
    );
  }
}
