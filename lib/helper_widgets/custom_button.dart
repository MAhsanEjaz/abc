import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? child;
  final Color? color;
  final Color? buttonColor;

  MyCustomButton({
    this.onPressed,
    this.child,
    this.color,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: buttonColor,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            child ?? '',
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
