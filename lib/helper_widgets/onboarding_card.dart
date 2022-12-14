import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingCard extends StatefulWidget {
  String? txt;
  String? title;

  String? image;

  Function()? onTap;

  OnboardingCard({this.txt, this.onTap, this.title,this.image});

  @override
  _OnboardingCardState createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(widget.image!),
        Text(
          widget.title!,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: (widget.onTap),
                child: Text(widget.txt!),
              )),
        )
      ],
    );
  }
}
