import 'dart:convert';
import 'package:abc_cash_and_carry/helper_services/token_save_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_services/page_route_service.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_check_pick.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/success_message_screen.dart';
import 'package:abc_cash_and_carry/services/save_customer_order_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'checkout_items_listview.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String deliveryDate = '';

  int? color;

  bool paymentOntap = false;

  bool switchTime = false;

  String? payment;

  Map<String, dynamic>? paymentIntentData;

  void saveCustomerOrderHandler(
      String email,
      String phone,
      String billingAddress,
      String? paymentMode,
      String orderAmount,
      String city,
      String customerName,
      String ticketId,
      int userId,
      String zipCode) async {
    CustomLoader.showLoader(context: context);

    bool res = await SaveCustomerOrderService().saveCustomerOrderService(
      context: context,
      email: email,
      phone: phone,
      billingAddress: billingAddress,
      paymentMode: paymentMode,
      orderAmount: orderAmount,
      city: city,
      customerName: customerName,
      ticketId: ticketId,
      userId: userId,
      zipCode: zipCode,
    );
  }

  Future<bool> makePaymentDialog() async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [Text('First complete your current order')],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserDataProvider, CartItemsProvider>(
        builder: (context, user, cartInvoice, _) {
      return WillPopScope(
        onWillPop: switchTime == true ? makePaymentDialog : null,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.white,
              title: Text(
                'Order Checkout',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer2<UserDataProvider, CartItemsProvider>(
                  builder: (context, user, cart, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: CheckoutItemsListview(
                      cartItem: cart.cartItems,
                    )),

                    //

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Select Payment Type',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),

                    CustomCheckPick(
                      iconData: FontAwesomeIcons.hand,
                      color: color == 0 ? true : false,
                      onTap: switchTime == true
                          ? null
                          : () {
                              color = 0;
                              setState(() {});
                            },
                      text: 'Cash on Delivery',
                    ),

                    // Stripe method here-------->>>>>>

                    // CustomCheckPick(
                    //   iconData: FontAwesomeIcons.moneyBillTransfer,
                    //   color: color == 1 ? true : false,
                    //   onTap: switchTime == true
                    //       ? null
                    //       : () async {
                    //           switchTime == true
                    //               ? CustomSnackBar.showSnackBar(
                    //                   context: context,
                    //                   message:
                    //                       'You have already pay please place you order')
                    //               : await makePayment(
                    //                   cart.totalCalculatedPrice.toString(),
                    //                   cart.cartItems![0].ticketId.toString());
                    //           color = 1;
                    //
                    //           setState(() {});
                    //         },
                    //   text: 'Stripe',
                    // ),

                    Consumer<CartItemsProvider>(builder: (context, data, _) {
                      return SizedBox(
                        // height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: color == 1
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    primary: Colors.orange),
                                onPressed: switchTime == false
                                    ? null
                                    : () async {
                                        saveCustomerOrderHandler(
                                            user.user!.data!.email.toString(),
                                            user.user!.data!.phoneNumber
                                                .toString(),
                                            user.user!.data!.address.toString(),
                                            'Stripe',
                                            data.totalCalculatedPrice
                                                .toString(),
                                            user.user!.data!.city.toString(),
                                            // '${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day}',
                                            user.user!.data!.userName!,
                                            cartInvoice.cartItems![0].ticketId
                                                .toString(),
                                            user.user!.data!.id!,
                                            user.user!.data!.zipCode
                                                .toString());

                                        PageRouteService.pageRoute(
                                            context: context,
                                            child: SuccessMessageScreen());
                                        setState(() {});
                                      },
                                child: Text('Place Order'))
                            : ElevatedButton(
                                onPressed: color == null
                                    ? null
                                    : () {
                                        if (validate()) {
                                          saveCustomerOrderHandler(
                                              user.user!.data!.email.toString(),
                                              user.user!.data!.phoneNumber
                                                  .toString(),
                                              user.user!.data!.address
                                                  .toString(),
                                              'COD',
                                              data.totalCalculatedPrice
                                                  .toString(),
                                              user.user!.data!.city.toString(),
                                              // '${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day}',
                                              user.user!.data!.userName!,
                                              cartInvoice.cartItems![0].ticketId
                                                  .toString(),
                                              user.user!.data!.id!,
                                              user.user!.data!.zipCode
                                                  .toString());
                                          PageRouteService.pageRoute(
                                              context: context,
                                              child: SuccessMessageScreen());
                                        }
                                      },
                                child: Text(
                                  'Place order',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    primary: Colors.orange),
                              ),
                      );
                    })
                  ],
                );
              }),
            )),
      );
    });
  }

  bool validate() {
    if (color == null) {
      CustomSnackBar.failedSnackBar(
          context: context, message: 'Please select payment method');
      return false;
    } else {
      return true;
    }
  }

  Future<void> makePayment(String amount, String cart) async {
    try {
      paymentIntentData = await createPaymentIntent(
          double.parse(amount).round().toString(),
          'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  // // applePay: true,
                  // // googlePay: true,
                  // testEnv: false,
                  style: ThemeMode.system,
                  // appearance: PaymentSheetAppearance(
                  //     colors: PaymentSheetAppearanceColors(
                  //         primary: Colors.black,
                  //         background: Colors.orange[100])),
                  // merchantCountryCode: 'US',
                  merchantDisplayName: 'ANNIE'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(cart);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String? cart) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) async {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        switchTime = true;
        await LocalStorageService().savePayment(context: context, pay: cart);

        setState(() {});

        print(switchTime);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Payment Successful")));
        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

//  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51JUUldDdNsnMpgdhx8kWqPhfiqHAHUVcd0BDw48M5HiP5GF36hOROHX2A2kq5BxYrzN2uZysgeDKpyTTzpOD1Ncf008VybA4Gu',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
