import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/drawer_item_card.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';

import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/screens/custom_profile_screen.dart';
import 'package:abc_cash_and_carry/screens/login_screen.dart';
import 'package:abc_cash_and_carry/screens/my_order_new_screen.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:abc_cash_and_carry/services/cart_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';

import '../helper_services/custom_loader.dart';
import '../helper_services/token_save_service.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int? userId;

  cartHandler() {
    userId =
        Provider.of<UserDataProvider>(context, listen: false).user!.data!.id;
    CartServices().getCartItems(context: context, id: userId!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartHandler();
  }

  Future<void> webInMobile() async {
    FlutterWebBrowser.openWebPage(
        safariVCOptions: SafariViewControllerOptions(
            barCollapsingEnabled: true,
            modalPresentationCapturesStatusBarAppearance: true,
            entersReaderIfAvailable: true,
            preferredBarTintColor: Colors.orange,
            dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
            modalPresentationStyle: UIModalPresentationStyle.popover,
            preferredControlTintColor: Colors.orange),
        customTabsOptions: CustomTabsOptions(
            instantAppsEnabled: true,
            urlBarHidingEnabled: true,
            showTitle: true),
        url: 'http://45.35.97.246:5960/Faqs');
  }

  Future<void> contactWeb() async {
    FlutterWebBrowser.openWebPage(
        safariVCOptions: SafariViewControllerOptions(
            dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
            barCollapsingEnabled: true,
            modalPresentationCapturesStatusBarAppearance: true,
            entersReaderIfAvailable: true,
            preferredControlTintColor: Colors.orange),
        customTabsOptions: CustomTabsOptions(
            instantAppsEnabled: true,
            urlBarHidingEnabled: true,
            showTitle: true),
        url: 'http://45.35.97.246:5960/ContactUs');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff7f7f7),
      width: MediaQuery.of(context).size.width * .70,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpeg'),
              DrawerItemCard(
                title: 'Profile',
                onPressed: () {
                  // NavigationServices.goNextAndDoNotKeepHistory(
                  //     context: context, widget: ProfileScreen());
                  NavigationServices.goNextAndKeepHistory(
                      context: context, widget: CustomerProfileScreen());
                },
                icon: CupertinoIcons.profile_circled,
              ),
              DrawerItemCard(
                title: 'Home',
                onPressed: () {
                  NavigationServices.goNextAndDoNotKeepHistory(
                      context: context, widget: ZoomDrawerScreen());
                },
                icon: CupertinoIcons.home,
              ),
              Consumer<CartItemsProvider>(builder: (context, data, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.black45)),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data.cartItems!.length.toString()),
                          )),
                    ),
                    DrawerItemCard(
                      title: 'Cart',
                      onPressed: () {
                        // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: CartScreen());
                        NavigationServices.goNextAndDoNotKeepHistory(
                            context: context, widget: CartScreen());
                      },
                      icon: CupertinoIcons.shopping_cart,
                    ),
                  ],
                );
              }),
              DrawerItemCard(
                title: 'Orders',
                onPressed: () {
                  NavigationServices.goNextAndKeepHistory(
                      context: context, widget: MyOrderNewScreen());
                  // CustomLoader.showLoader(context: context);
                  // await Future.delayed(Duration(seconds: 2));
                  // CustomLoader.hideeLoader(context);
                },
                icon: CupertinoIcons.news,
              ),
              DrawerItemCard(
                title: 'Faqs',
                onPressed: () {
                  webInMobile();
                },
                icon: CupertinoIcons.question_diamond,
              ),
              DrawerItemCard(
                title: 'Contacts',
                onPressed: () {
                  contactWeb();
                },
                icon: CupertinoIcons.command,
              ),
              Consumer<UserDataProvider>(builder: (context, data, _) {
                return DrawerItemCard(
                  title: 'Logout',
                  onPressed: () async {
                    CustomLoader.showLoader(context: context);
                    await Future.delayed(Duration(seconds: 2));
                    await LocalStorageService()
                        .saveUser(context: context, user: '');
                    CustomLoader.hideeLoader(context);

                    NavigationServices.goNextAndDoNotKeepHistory(
                        context: context, widget: LoginScreen());
                    //
                  },
                  icon: Icons.exit_to_app,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
