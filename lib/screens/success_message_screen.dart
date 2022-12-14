import 'dart:ui';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SuccessMessageScreen extends StatefulWidget {
  const SuccessMessageScreen({Key? key}) : super(key: key);

  @override
  _SuccessMessageScreenState createState() => _SuccessMessageScreenState();
}

class _SuccessMessageScreenState extends State<SuccessMessageScreen> {
  ConfettiController controller = ConfettiController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.play();
  }

  Future<bool> pop() async {
    return await showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => Text(''));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    return Consumer<CartItemsProvider>(builder: (context, data, _) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Pulse(
          animate: true,
          child: WillPopScope(
            onWillPop: pop,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConfettiWidget(
                          numberOfParticles: 3,
                          displayTarget: false,
                          blastDirection: 5,
                          maximumSize: Size(50, 50),
                          confettiController: controller,
                          shouldLoop: true,
                          blastDirectionality: BlastDirectionality.explosive,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Thank You',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5.0,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(colors: [
                                              Colors.orange,
                                              Colors.yellow
                                            ])),
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(22.0),
                                              child: Icon(
                                                Icons.check,
                                                size: 40,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                '\$${data.totalCalculatedPrice.round().toString()}',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0, vertical: 10),
                                child: MyCustomButton(
                                  onPressed: () {
                                    NavigationServices
                                        .goNextAndDoNotKeepHistory(
                                            context: context,
                                            widget: ZoomDrawerScreen());
                                  },
                                  child: 'Continue Shopping',
                                  buttonColor: Colors.green,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
