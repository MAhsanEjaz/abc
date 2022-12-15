import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/categories_provider.dart';
import 'package:abc_cash_and_carry/providers/current_order_provider.dart';
import 'package:abc_cash_and_carry/providers/customer_profile_provider.dart';
import 'package:abc_cash_and_carry/providers/inventory_itom_provider.dart';
import 'package:abc_cash_and_carry/providers/item_get_by_sub_categories_item_provider.dart';
import 'package:abc_cash_and_carry/providers/item_get_sub_categories_provider.dart';
import 'package:abc_cash_and_carry/providers/item_sub_category_provider.dart';
import 'package:abc_cash_and_carry/providers/my_orders_provider.dart';
import 'package:abc_cash_and_carry/providers/new_previous_order_provider.dart';
import 'package:abc_cash_and_carry/providers/order_provider.dart';
import 'package:abc_cash_and_carry/providers/payment_methods_provider.dart';
import 'package:abc_cash_and_carry/providers/products_provider.dart';
import 'package:abc_cash_and_carry/providers/profile_provider.dart';
import 'package:abc_cash_and_carry/providers/search_item_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51JUUldDdNsnMpgdhSlxjCo0yQBGHy9RsTQojb3YENwH5llfYiEmqqFjkc6SmsSQpLb9BH40OKQb0fwTlfifqJhFd00Cy7xTNwd';
  await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserDataProvider()),
          ChangeNotifierProvider(create: (context) => CategoriesProvider()),
          ChangeNotifierProvider(create: (context) => ProductsProvider()),
          ChangeNotifierProvider(create: (context) => CartItemsProvider()),
          ChangeNotifierProvider(create: (context) => MyOrdersProvider()),
          ChangeNotifierProvider(create: (context) => PaymentMethodsProvider()),
          ChangeNotifierProvider(
              create: (context) => ItemSubCategoryProvider()),
          ChangeNotifierProvider(
              create: (context) => ItemGetSubCategoriesProvider()),
          ChangeNotifierProvider(create: (context) => SearchItemProvider()),
          ChangeNotifierProvider(
              create: (context) => ItemGetBySubCategoryIDProvider()),
          ChangeNotifierProvider(create: (context) => InventoryItemProvider()),
          ChangeNotifierProvider(create: (context) => ProfileProvider()),
          ChangeNotifierProvider(
              create: (context) => CartInvoiceNumberProvider()),
          ChangeNotifierProvider(create: (context) => OrderProvider()),
          ChangeNotifierProvider(
              create: (context) => CustomerProfileProvider()),
          ChangeNotifierProvider(
              create: (context) => NewPreviousOrderProvider()),
          ChangeNotifierProvider(create: (context) => CurrentOrderProvider())
        ],
        child: MaterialApp(
          title: 'ABC Cash & Carry',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black))),
          // home: LoginScreen(),
          home: SplashScreen(),

          // home: SuccessMessageScreen(),

          // home: NewCartScreen(),
          // home: NewProfileScreen(),
        ));
  }
}
