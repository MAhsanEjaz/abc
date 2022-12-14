import 'package:abc_cash_and_carry/helper_widgets/dialogue_card.dart';
import 'package:flutter/material.dart';

class CustomErrorDialogue {
  static void showDialogue(
      {required BuildContext context, String message = 'Please wait'}) {
    AlertDialog androidDialog = AlertDialog(
        content: DialogueCard(
      title: 'Internet Connection Error',
      description:
          'Please check your mobile\'s internet connection, connect to stable wifi or a cellular connection',
      onOkPress: () {
        Navigator.pop(context);
      },
      onExitPress: () {
        Navigator.pop(context);
      },
    ));
    print('loader started ..');

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return androidDialog;
        });
  }

  static void hideDialogue(BuildContext context) {
    print('hiding loader..');
    // Navigator.pop(context);
    Navigator.of(context, rootNavigator: true).pop();
    // Navigator.of(context).pop();
  }
}
