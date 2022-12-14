import 'dart:ui';

import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_textfield.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginDialog extends StatefulWidget {
  TextEditingController? emailControl;
  TextEditingController? passwordControl;
  Function()? onTap;

  CustomLoginDialog({this.onTap, this.emailControl, this.passwordControl});

  @override
  _CustomLoginDialogState createState() => _CustomLoginDialogState();
}

class _CustomLoginDialogState extends State<CustomLoginDialog> {
  bool password = true;

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      animate: true,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 4, sigmaX: 5),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                20,
                              ),
                              topLeft: Radius.circular(20))),
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpeg'))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'You need to login first',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                        controller: widget.emailControl,
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                        obscure: password,
                        postfixIcon: password
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                        onPressed: () {
                          setState(() {
                            password = !password;
                          });
                        },
                        controller: widget.passwordControl,
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: MyCustomButton(
                        onPressed: (widget.onTap),
                        buttonColor: Colors.orange,
                        child: 'Login',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
