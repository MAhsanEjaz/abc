import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_services/token_save_service.dart';
import 'package:abc_cash_and_carry/helper_widgets/onboarding_card.dart';
import 'package:abc_cash_and_carry/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  PageController pageController = PageController();

  bool? onBoardScreen;

  succesdata() async {
    var data = await LocalStorageService().getOnboard(context: context);
    if (data == true) {
      print('data--->$data');
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    succesdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () async {
                NavigationServices.goNextAndDoNotKeepHistory(
                    context: context, widget: LoginScreen());

                onBoardScreen = true;

                await LocalStorageService()
                    .saveOnboard(context: context, saveBoard: onBoardScreen!);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                OnboardingCard(
                  image: "assets/images/onbr1.jpg",
                  txt: 'Next',
                  title: 'Looking for Items',
                  onTap: () {
                    pageController.animateToPage(1,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                  },
                ),
                OnboardingCard(
                  image: 'assets/images/payment.jpg',
                  txt: 'Next',
                  title: 'Make a Payment',
                  onTap: () async {
                    pageController.animateToPage(2,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                  },
                ),
                OnboardingCard(
                  image: 'assets/images/send.jpg',
                  txt: 'Finish',
                  title: 'Send Items',
                  onTap: () async {
                    NavigationServices.goNextAndDoNotKeepHistory(
                        context: context, widget: LoginScreen());
                    pageController.animateToPage(3,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);

                    onBoardScreen = true;

                    await LocalStorageService().saveOnboard(
                        context: context, saveBoard: onBoardScreen!);
                  },
                ),
              ],
            ),
            Positioned(
                bottom: 20,
                left: 20,
                child: SmoothPageIndicator(
                    effect: WormEffect(
                        dotHeight: 9,
                        dotWidth: 9,
                        activeDotColor: Colors.orange),
                    controller: pageController,
                    count: 3))
          ],
        ),
      ),
    );
  }
}
