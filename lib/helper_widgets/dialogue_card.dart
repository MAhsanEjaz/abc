import 'package:flutter/material.dart';

class DialogueCard extends StatelessWidget {
  String title;
  String description;
  String okButtonText;
  String exitButtonText;
  Function()? onOkPress;
  Function()? onExitPress;

  DialogueCard(
      {this.title = 'Error',
      this.description = 'Something went wrong',
      this.okButtonText = 'Ok',
      this.exitButtonText = 'Exit',
      this.onOkPress,
      this.onExitPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$title'),
          Text('$description'),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: onOkPress,
                child: Text('$okButtonText'),
              ),
              TextButton(
                onPressed: onExitPress,
                child: Text('$exitButtonText'),
              )
            ],
          )
        ],
      ),
    );
  }
}
