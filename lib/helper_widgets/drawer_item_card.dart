import 'package:flutter/material.dart';

class DrawerItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  DrawerItemCard(
      {required this.title, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            onPressed();
          },
          child: ListTile(
            leading: Icon(
              icon,
              size: 20,
            ),
            title: Text(
              '$title',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          )),
    );
  }
}
