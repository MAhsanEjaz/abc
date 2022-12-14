import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Center(
                child: SizedBox(
                    height: 150, child: Image.asset('assets/images/logo.jpeg')),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(hintText: 'Email'),
              SizedBox(
                height: 20,
              ),
              MyCustomButton(
                onPressed: () {},
                child: 'Continue',
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
