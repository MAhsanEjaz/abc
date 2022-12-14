import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckPick extends StatefulWidget {
  bool color;
  String? text;
  IconData? iconData;
  Function()? onTap;

  CustomCheckPick({required this.color, this.onTap, this.text, this.iconData});

  @override
  _CustomCheckPickState createState() => _CustomCheckPickState();
}

class _CustomCheckPickState extends State<CustomCheckPick> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: widget.color ? 5 : 0,
      child: InkWell(
        onTap: (widget.onTap),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                widget.iconData,
                color: widget.color ? Colors.orange : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  widget.text!,
                  style: TextStyle(
                      color: widget.color ? Colors.red : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
              ),
              Spacer(),
              Icon(
                CupertinoIcons.forward,
                color: widget.color ? Colors.orange : Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
