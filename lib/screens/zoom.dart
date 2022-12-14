import 'package:abc_cash_and_carry/screens/custom_drawer.dart';
import 'package:abc_cash_and_carry/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerScreen extends StatefulWidget {
  const ZoomDrawerScreen({Key? key}) : super(key: key);

  @override
  _ZoomDrawerScreenState createState() => _ZoomDrawerScreenState();
}

class _ZoomDrawerScreenState extends State<ZoomDrawerScreen> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ZoomDrawer(
            angle: 0,
            drawerShadowsBackgroundColor: Colors.orange,
            closeCurve: Curves.bounceIn,
            menuBackgroundColor: Color(0xfff7f7f7),
            clipMainScreen: true,
            mainScreenOverlayColor: Colors.red.withOpacity(0.1),
            mainScreenTapClose: true,
            showShadow: true,
            openCurve: Curves.easeInOutCubic,
            shadowLayer2Color: Colors.teal.withOpacity(0.3),
            controller: zoomDrawerController,
            menuScreen: CustomDrawer(),
            mainScreen: HomeScreen()));
  }
}
