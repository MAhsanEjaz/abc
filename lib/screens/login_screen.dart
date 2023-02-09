import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_services/internet_connectivity_service.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_textfield.dart';
import 'package:abc_cash_and_carry/screens/forget_password_screen.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:abc_cash_and_carry/services/login_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController =
      TextEditingController(); //text: 'nabeelbest7@gmail.com'
  TextEditingController passwordTextController =
      TextEditingController(); //text: '123454321'
  bool isPasswordVisible = true;

  _validation() {
    if (emailTextController.text.isEmpty ||
        passwordTextController.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: 'fill valid email & password');
      return false;
    } else {
      return true;
    }
  }

  _loginHandler() async {
    bool res1 = await InternetCheckService.checkInternet();

    if (res1) {
      CustomLoader.showLoader(context: context);

      bool res = await LoginApiService().loginService(
          context: context,
          password: passwordTextController.text,
          email: emailTextController.text);

      print('res----$res');
      CustomLoader.hideLoader(context);

      if (res) {
        NavigationServices.goNextAndDoNotKeepHistory(
            context: context, widget: ZoomDrawerScreen());
      }
    } else {
      CustomSnackBar.failedSnackBar(
          context: context, message: 'Please connect internet first');
    }
  }

  int? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Color(0xfff7f7f7),
            resizeToAvoidBottomInset: false,
            body: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                  Center(
                    child: SizedBox(
                        height: 150,
                        child: Image.asset('assets/images/logo.jpeg')),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 0),
                      margin: EdgeInsets.only(top: 0, left: 15, right: 15),
                      height: 400,
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: 'Email',
                            hintText: 'email@gmail.com',
                            controller: emailTextController,
                            type: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            type: TextInputType.visiblePassword,
                            onPressed: () {
                              isPasswordVisible = !isPasswordVisible;
                              setState(() {});
                            },
                            obscure: isPasswordVisible,
                            labelText: 'Password',
                            hintText: '********',
                            controller: passwordTextController,
                            postfixIcon: isPasswordVisible
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  NavigationServices.goNextAndDoNotKeepHistory(
                                      context: context,
                                      widget: ForgetPasswordScreen());
                                },
                                child: Text('Forget Password')),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: MyCustomButton(
                                buttonColor: Colors.orange,
                                onPressed: () {
                                  if (_validation()) {
                                    _loginHandler();
                                  }
                                },
                                child: 'Login',
                                // color: Colors.red,
                                // buttonColor: Colors.pink,
                              )),

                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: TextButton(
                          //       onPressed: () {
                          //         NavigationServices.goNextAndKeepHistory(
                          //             context: context,
                          //             widget: HomeScreenWithoutLogin());
                          //       },
                          //       child: SizedBox(
                          //         width: 70,
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               'Guest',
                          //               style: TextStyle(color: Colors.orange),
                          //             ),
                          //             Icon(
                          //               Icons.arrow_forward,
                          //               color: Colors.orange,
                          //             ),
                          //           ],
                          //         ),
                          //       )),
                          // ),
                        ],
                      ))
                ])))));
  }

  _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
