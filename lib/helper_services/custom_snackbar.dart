import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSnackBar(
      {required BuildContext context, required String message}) {
    print('snackbar message --> $message');

    final snackBar = SnackBar(
      padding: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
        child: Text(
          "$message",
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
      ),
      backgroundColor: Colors.green[700],
      duration: Duration(milliseconds: 1350),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void failedSnackBar(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      padding: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 15),
        child: Text(
          "$message",
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
      ),
      backgroundColor: Colors.red[700],
      duration: Duration(milliseconds: 1350),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
