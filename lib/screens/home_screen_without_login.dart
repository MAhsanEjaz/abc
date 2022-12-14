import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_services/page_route_service.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_login_dialog.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_textfield.dart';
import 'package:abc_cash_and_carry/helper_widgets/drawer_item_card.dart';
import 'package:abc_cash_and_carry/screens/inventory_item_screen.dart';
import 'package:abc_cash_and_carry/screens/login_screen.dart';
import 'package:abc_cash_and_carry/screens/search_screen.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:abc_cash_and_carry/services/login_services.dart';
import 'package:abc_cash_and_carry/services/search_item_service.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';
import '../providers/inventory_itom_provider.dart';
import '../services/inventory_item_service.dart';
import 'categories_listview_horizontal.dart';
import 'home_screen.dart';

class HomeScreenWithoutLogin extends StatefulWidget {
  @override
  _HomeScreenWithoutLoginState createState() => _HomeScreenWithoutLoginState();
}

class _HomeScreenWithoutLoginState extends State<HomeScreenWithoutLogin> {
  String? text;
  int skipCount = 0;
  int getCount = 30;

  inventoryHandler() {
    InventoryItemService().inventoryItemService(
        context: context, getCount: getCount, skipCount: skipCount);
  }

  TextEditingController searchControl = TextEditingController();

  searchHandler() async {
    CustomLoader.showLoader(context: context);
    bool res = await SearchItemService()
        .itemSearch(context: context, keyWord: searchControl.text);
    CustomLoader.hideeLoader(context);

    if (res) {
      NavigationServices.goNextAndKeepHistory(
          context: context,
          widget: SearchScreen1(
            text: text,
          ));
    }

    print('message------$res');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      inventoryHandler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: FlipInY(
        animate: true,
        child: Scaffold(
          drawer: CustomDrawer1(),
          appBar: AppBar(
            title: Text(
              'Welcome Guest',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (context) => IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       PageRouteService.pageRoute(
            //           context: context,
            //           child: CustomLoginDialog(
            //             emailControl: emailTextController,
            //             passwordControl: passwordTextController,
            //             onTap: () {
            //               if (_validation()) _loginHandler();
            //             },
            //           ));
            //
            //       // _loginBottomSheet();
            //     },
            //     icon: Icon(
            //       Icons.shopping_cart,
            //       color: Colors.black,
            //     ),
            //   ),
            // ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    controller: searchControl,
                    hintText: 'Search',
                    onSubmit: (value) {
                      text = value;
                      searchHandler();
                    },
                    prefixIcon: Icons.search_sharp,
                    // onchange: (keyword) {
                    //   keyword = searchHandler();
                    //
                    //   print(keyword);
                    // },
                  ),
                  // CategoriesListViewHorizontal1(),

                  // HorizontalProductViewScreen1(
                  //   lable: 'Featured',
                  //   catId: '12',
                  // ),
                  // HorizontalProductViewScreen1(
                  //   lable: 'Best selling',
                  //   catId: '13',
                  // ),
                  // HorizontalProductViewScreen1(
                  //   lable: 'Customers favourite',
                  //   catId: '14',
                  // ),

                  // CategoriesListViewHorizontal(),

                  Consumer<InventoryItemProvider>(builder: (context, data, _) {
                    return data.inventoryItems!.isEmpty
                        ? Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 2.8),
                            child: Center(
                              child: CupertinoActivityIndicator(
                                radius: 14,
                              ),
                            ),
                          )
                        : InventoryItemScreen1();
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

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
    CustomLoader.showLoader(context: context);

    // Map body = {
    //   "email": emailTextController.text,
    //   "password": passwordTextController.text
    // };

    bool res = await LoginApiService().loginService(
        context: context,
        email: emailTextController.text,
        password: passwordTextController.text);

    CustomLoader.hideLoader(context);

    if (res) {
      NavigationServices.goNextAndDoNotKeepHistory(
          context: context, widget: HomeScreen());
    } else {
      Navigator.pop(context);
    }
  }

  _loginBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            margin: EdgeInsets.only(top: 15, right: 15, left: 15),
            color: Colors.white,
            height: 400,
            child: Column(
              children: [
                Text('You need to login first'),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'email@gmail.com',
                  controller: emailTextController,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: '********',
                  controller: passwordTextController,
                ),
                SizedBox(
                  height: 20,
                ),
                MyCustomButton(
                  onPressed: () {
                    if (_validation()) {
                      _loginHandler();
                    }
                  },
                  child: 'Login',
                  // color: Colors.red,
                  // buttonColor: Colors.pink,
                ),
              ],
            ),
          );
        });
  }
}

class CustomDrawer1 extends StatefulWidget {
  @override
  _CustomDrawer1State createState() => _CustomDrawer1State();
}

class _CustomDrawer1State extends State<CustomDrawer1> {
  Future<void> webInMobile() async {
    FlutterWebBrowser.openWebPage(
        url: 'http://199.231.160.216/abcwebsite/Faqs');
  }

  Future<void> contactWeb() async {
    FlutterWebBrowser.openWebPage(
        url: 'http://199.231.160.216/abcwebsite/ContactUs');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .80,
      color: Color(0xfff7f7f7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: Image.asset(
              'assets/images/logo.jpeg',
              height: 150,
            ),
          ),
          DrawerItemCard(
            title: 'Profile',
            onPressed: () {
              PageRouteService.pageRoute(
                  context: context,
                  child: CustomLoginDialog(
                    emailControl: emailTextController,
                    passwordControl: passwordTextController,
                    onTap: () {
                      if (_validation()) _loginHandler();
                    },
                  ));

              // _loginBottomSheet();
            },
            icon: CupertinoIcons.profile_circled,
          ),
          DrawerItemCard(
            title: 'Home',
            onPressed: () {
              NavigationServices.goNextAndDoNotKeepHistory(
                  context: context, widget: HomeScreenWithoutLogin());
            },
            icon: CupertinoIcons.home,
          ),
          DrawerItemCard(
            title: 'Cart',
            onPressed: () {
              PageRouteService.pageRoute(
                  context: context,
                  child: CustomLoginDialog(
                    emailControl: emailTextController,
                    passwordControl: passwordTextController,
                    onTap: () {
                      if (_validation()) _loginHandler();
                    },
                  ));
              //
              // _loginBottomSheet();
            },
            icon: CupertinoIcons.shopping_cart,
          ),
          DrawerItemCard(
            title: 'Orders',
            onPressed: () {
              PageRouteService.pageRoute(
                  context: context,
                  child: CustomLoginDialog(
                    emailControl: emailTextController,
                    passwordControl: passwordTextController,
                    onTap: () {
                      if (_validation()) _loginHandler();
                    },
                  ));
              // _loginBottomSheet();
            },
            icon: CupertinoIcons.news,
          ),
          DrawerItemCard(
            title: 'Login',
            onPressed: () {
              NavigationServices.goNextAndDoNotKeepHistory(
                  context: context, widget: LoginScreen());
            },
            icon: Icons.login,
          ),
          DrawerItemCard(
              title: 'Faqs',
              onPressed: () {
                webInMobile();
              },
              icon: CupertinoIcons.app_badge),
          DrawerItemCard(
              title: 'Contact us',
              onPressed: () {
                contactWeb();
              },
              icon: Icons.contact_page_outlined),
        ],
      ),
    );
  }

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

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
    CustomLoader.showLoader(context: context);

    Map body = {
      "email": emailTextController.text,
      "password": passwordTextController.text
    };

    bool res = await LoginApiService().loginService(
        context: context,
        email: emailTextController.text,
        password: passwordTextController.text);

    CustomLoader.hideLoader(context);

    if (res) {
      NavigationServices.goNextAndDoNotKeepHistory(
          context: context, widget: ZoomDrawerScreen());
    } else {
      Navigator.pop(context);
    }
  }

  _loginBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            margin: EdgeInsets.only(top: 15, right: 15, left: 15),
            color: Colors.white,
            height: 400,
            child: Column(
              children: [
                Text('You need to login first'),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'email@gmail.com',
                  controller: emailTextController,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: '********',
                  controller: passwordTextController,
                ),
                SizedBox(
                  height: 20,
                ),
                MyCustomButton(
                  onPressed: () {
                    if (_validation()) {
                      _loginHandler();
                    }
                  },
                  child: 'Login',
                  // color: Colors.red,
                  // buttonColor: Colors.pink,
                ),
              ],
            ),
          );
        });
  }
}
