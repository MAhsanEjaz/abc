import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_services/page_route_service.dart';
import 'package:abc_cash_and_carry/helper_widgets/bottom_sheet_header.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_login_dialog.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:abc_cash_and_carry/services/increase_item_qty_in_cart_service.dart';
import 'package:abc_cash_and_carry/services/remove_in_cart_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helper_services/custom_loader.dart';
import '../helper_services/custom_snackbar.dart';
import '../models/inventory_item_get_model.dart';
import '../services/login_services.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel? inventoryItemData;

  ProductDetailScreen({
    this.inventoryItemData,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double cartItemPrice = 0;
  int quantity = 1;
  int userid = 0;
  String? tickerId2;

  IncreamentItemInCartHandler(int? productId) {
    tickerId2 = Provider.of<CartInvoiceNumberProvider>(context, listen: false)
        .cartInvoiceNumber;

    IncreamentItemInCartService().increamentItemInCart(
        context: context, ticketId: tickerId2, id: productId);
  }

  String? tickerId3;

  decreaseItemQuantityInCartHandler(int? productId) {
    tickerId3 = Provider.of<CartInvoiceNumberProvider>(context, listen: false)
        .cartInvoiceNumber;

    RemoveItemInCartService().removeItemInCartService(
        context: context, id: productId, ticketId: tickerId3);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemsProvider>(builder: (_context, data, _) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget
                                      .inventoryItemData!.itemImage ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJEGeMcYEcGfn3yY_sIMH1crG02jRdggzCSQ&usqp=CAU'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        widget.inventoryItemData!.name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Text(
                        '\$${widget.inventoryItemData!.retail.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0, right: 13),
                      child: Text(
                        widget.inventoryItemData!.description == null
                            ? 'This test was a close one! While most staffers in our Test Kitchen preferred Pepsi in a blind test, that doesn’t mean that Coca-Cola was bad in any way.'
                            : widget.inventoryItemData!.description.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () async {
                        // CustomLoader.showLoader(context: context);
                        // await
                        AddToCartService.addItemToCart(
                            product: widget.inventoryItemData!,
                            // ticketIDD: cart.cartItems![0].ticketId.toString(),
                            context: context,
                            quantity: quantity);

                        // CustomLoader.hideeLoader(context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange.shade400),
                      child: Text('Add to cart')),
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          customBottomSheet(false, context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red.shade400),
                      child: Text('Buy now')),
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  customBottomSheet(bool isBuy, BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BottomSheetHader(
                        name: widget.inventoryItemData!.name.toString(),
                        image: widget.inventoryItemData!.itemImage == null
                            ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJEGeMcYEcGfn3yY_sIMH1crG02jRdggzCSQ&usqp=CAU'
                            : widget.inventoryItemData!.itemImage.toString(),
                        price: widget.inventoryItemData!.retail.toString(),
                      ),

                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer2<UserDataProvider, CartItemsProvider>(
                            builder: (_context, user, cart, _) {
                          return MyCustomButton(
                            child: isBuy ? 'Add to Cart' : 'Buy Now',
                            buttonColor: isBuy ? Colors.orange : Colors.red,
                            onPressed: () async {
                              if (isBuy) {
                                Navigator.pop(context);
                                if (widget.inventoryItemData!.stock?.quantity ==
                                        '0' &&
                                    widget.inventoryItemData!.stock?.quantity ==
                                        null) {
                                  return CustomSnackBar.failedSnackBar(
                                      context: context,
                                      message: 'Item out of stock');
                                } else {
                                  // CustomLoader.showLoader(context: context);
                                  // await

                                  AddToCartService.addItemToCart(
                                      product: widget.inventoryItemData!,
                                      context: context,
                                      // ticketIDD: cart.cartItems![0].ticketId.toString(),
                                      quantity: quantity);
                                }
                                // CustomLoader.hideeLoader(context);
                              } else {
                                Navigator.pop(context);
                                if (widget.inventoryItemData!.stock?.quantity ==
                                        '0' &&
                                    widget.inventoryItemData!.stock?.quantity ==
                                        null) {
                                  return CustomSnackBar.failedSnackBar(
                                      context: context,
                                      message: 'Item out of stock');
                                } else {
                                  CustomLoader.showLoader(context: context);
                                  await AddToCartService.addItemToCart(
                                      product: widget.inventoryItemData!,
                                      // ticketIDD: cart.cartItems![0].ticketId.toString(),
                                      context: context,
                                      quantity: quantity);

                                  CustomLoader.hideeLoader(context);

                                  NavigationServices.goNextAndKeepHistory(
                                      context: context, widget: CartScreen());
                                }
                              }
                            },
                            color: Colors.white,
                          );
                        }),
                      ),
                      // isBuy
                      //     ? Container()
                      //     : TextButton(
                      //         onPressed: () {
                      //           Navigator.of(context).pop();
                      //           NavigationServices.goNextAndKeepHistory(
                      //               context: context, widget: CheckoutScreen());
                      //         },
                      //         child: Text("Check Out"))
                    ],
                  )),
            ));
  }
}

class ProductDetail1Screen extends StatefulWidget {
  ProductModel? inventoryItemData;

  ProductDetail1Screen({this.inventoryItemData});

  @override
  _ProductDetail1ScreenState createState() => _ProductDetail1ScreenState();
}

class _ProductDetail1ScreenState extends State<ProductDetail1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     NavigationServices.goNextAndDoNotKeepHistory(
        //         context: context, widget: HomeScreen());
        //   },
        //   icon: Icon(CupertinoIcons.back),
        // ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget
                                  .inventoryItemData!.itemImage ??
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJEGeMcYEcGfn3yY_sIMH1crG02jRdggzCSQ&usqp=CAU'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(widget.inventoryItemData!.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17))),
                Padding(
                    padding: const EdgeInsets.only(left: 13.0, right: 13),
                    child: Text(
                        widget.inventoryItemData!.description == null
                            ? 'This test was a close one! While most staffers in our Test Kitchen preferred Pepsi in a blind test, that doesn’t mean that Coca-Cola was bad in any way.'
                            : widget.inventoryItemData!.description.toString(),
                        style: TextStyle(fontSize: 16)))
              ]))),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        customBottomSheet(true, context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange.shade400),
                    child: Text('Add to cart')),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        customBottomSheet(false, context);
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.red.shade400),
                    child: Text('Buy now')),
              ),
            ],
          )
        ],
      ),
    );
  }

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  _validation(BuildContext context) {
    if (emailTextController.text.isEmpty ||
        passwordTextController.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: 'fill valid email & password');
      return false;
    } else {
      return true;
    }
  }

  _loginHandler(BuildContext context) async {
    CustomLoader.showLoader(context: context);

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

  customBottomSheet(bool isBuy, BuildContext _context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: _context,
        builder: (_context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BottomSheetHader(
                        price: '',
                        name: widget.inventoryItemData!.name.toString(),
                        image: widget.inventoryItemData!.itemImage == null
                            ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJEGeMcYEcGfn3yY_sIMH1crG02jRdggzCSQ&usqp=CAU'
                            : widget.inventoryItemData!.itemImage.toString(),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<UserDataProvider>(
                            builder: (_context, user, _) {
                          return MyCustomButton(
                            child: isBuy ? 'Add to Cart' : 'Buy Now',
                            buttonColor: isBuy ? Colors.orange : Colors.red,
                            onPressed: () {
                              Navigator.pop(_context);

                              PageRouteService.pageRoute(
                                  context: _context,
                                  child: CustomLoginDialog(
                                    emailControl: emailTextController,
                                    passwordControl: passwordTextController,
                                    onTap: () {
                                      // if (_validation(_context))
                                      _loginHandler(context);
                                    },
                                  ));

                              // _loginBottomSheet(context);
                            },
                            color: Colors.white,
                          );
                        }),
                      ),
                    ],
                  )),
            ));
  }
}
