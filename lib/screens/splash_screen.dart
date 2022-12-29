import 'dart:async';
import 'dart:convert';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_services/token_save_service.dart';
import 'package:abc_cash_and_carry/models/user_model.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/onboarding_screens.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _checkUser() async {
    var user = await LocalStorageService().getUserSavedData(context: context);


    if (user == null || user.isEmpty) {
      Timer(Duration(seconds: 8), () {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => OnboardingScreens()));
      });
    } else {
      Timer(Duration(seconds: 8), () {
        UserModel user1 = UserModel.fromJson(json.decode(user.toString()));
        Provider.of<UserDataProvider>(context, listen: false)
            .updateUserData(newUser: user1);

        NavigationServices.goNextAndDoNotKeepHistory(
            context: context, widget: ZoomDrawerScreen());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Pulse(
                duration: Duration(seconds: 6),
                animate: true,
                child: Image.asset('assets/images/logo.jpeg'))
          ],
        ),
      ),
    );
  }
}
