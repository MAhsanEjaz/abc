import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_textfield.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/inventory_itom_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/custom_drawer.dart';
import 'package:abc_cash_and_carry/services/add_quantity_manually_service.dart';
import 'package:abc_cash_and_carry/services/cart_invoice_number_service.dart';
import 'package:abc_cash_and_carry/services/cart_services.dart';
import 'package:abc_cash_and_carry/services/delete_from_cart_service.dart';
import 'package:abc_cash_and_carry/services/increase_item_qty_in_cart_service.dart';
import 'package:abc_cash_and_carry/services/remove_in_cart_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helper_services/navigation_services.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //quantityController
  TextEditingController quantityControl = TextEditingController();

  //ticketId
  String? ticketId;

  //invoice number handler

  getCartInvoiceNumberHandler() async {
    bool res = await CartInvoiceNumberService()
        .cartInvoiceNumberService(context: context);
    print('getAllCategories -> $res');
  }

  // addQuantityHandler
  addQuantityManuallyHandler(int? id, String? ticket) {
    AddQuantityManually().addQuantityManually(
        context: context,
        ticketId: ticket,
        id: id,
        quantity: quantityControl.text);
  }

  int? userid;

  // getCartHandler

  getCartItemsHandler() {
    userid =
        Provider.of<UserDataProvider>(context, listen: false).user!.data!.id!;
    CartServices().getCartItems(context: context, id: userid!);
  }

  //deleteFromCart handler
  deleteFromCartHandler(int prodId, String? delTicket) async {
    CustomLoader.showLoader(context: context);
    await DeleteFromCartService().deleteFromCartService(
        context: context, ticketId: delTicket!, id: prodId);
    CustomLoader.hideLoader(context);
  }

  //increaseItemsInCartHandler
  increaseItemsInCartHandler(int? productId, String? tickerId2) {
    // tickerId2 = Provider.of<CartInvoiceNumberProvider>(context, listen: false)
    //     .cartInvoiceNumber;
    IncreamentItemInCartService().increamentItemInCart(
        context: context, ticketId: tickerId2, id: productId);
  }

  //decreaseItemQuantityInCartHandler
  decreaseItemQuantityInCartHandler(int? productId, String? tickerId3) {
    // tickerId3 = Provider.of<CartInvoiceNumberProvider>(context, listen: false)
    //     .cartInvoiceNumber;
    RemoveItemInCartService().removeItemInCartService(
        context: context, id: productId, ticketId: tickerId3);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCartItemsHandler();
      getCartInvoiceNumberHandler();
    });
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<CartItemsProvider, InventoryItemProvider,
            CartInvoiceNumberProvider>(
        builder: (context, cart, inventory, invoice, _) {
      if (cart.cartItems!.isEmpty) {
        return Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('No Item')),
            body: Center(child: Text('Your Cart is Empty')));
      } else {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  'Total Items: ${cart.cartItems!.length}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                // Text(
                //   'Total Items: ${cart.cartItems!.length}',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
            actions: [
              Consumer<CartInvoiceNumberProvider>(
                  builder: (context, dataInvoice, _) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: cart.cartItems == null
                        ? CupertinoActivityIndicator(
                            radius: 10,
                          )
                        : Text(
                            'Cart Invoice: ${invoice.cartInvoiceNumber.toString()}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                  ),
                );
              }),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cart.cartItems!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.orange.withOpacity(0.1),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfTDL4eFW-ISJtNFLFMBWXgM8Icd62vPrazQ&usqp=CAU'),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Container(
                                                height: 80,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Container(
                                                      width: 160,
                                                      child: Text(
                                                        cart.cartItems![index]
                                                            .name
                                                            .toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Cost: ${cart.cartItems![index].retail.toString()}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: IconButton(
                                                  color: Colors.orange,
                                                  onPressed: () {
                                                    deleteFromCartHandler(
                                                        cart.cartItems![index]
                                                            .id!,
                                                        // invoice
                                                        //     .cartInvoiceNumber
                                                        //     .toString()
                                                        cart.cartItems![index]
                                                            .ticketId);
                                                    setState(() {
                                                      cart.deleteCartItems(
                                                          index: index);

                                                      // cart.cartItems!
                                                      //     .removeAt(index);
                                                    });
                                                  },
                                                  icon: Icon(
                                                      CupertinoIcons.delete),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.orange,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 4.0, left: 4),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Card(
                                                    child: IconButton(
                                                        onPressed: (cart
                                                                    .cartItems![
                                                                        index]
                                                                    .quantity <
                                                                2)
                                                            ? null
                                                            : () {
                                                                cart
                                                                    .cartItems![
                                                                        index]
                                                                    .quantity--;
                                                                Provider.of<CartItemsProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .updateCartItems(
                                                                        index:
                                                                            index,
                                                                        qty: cart
                                                                            .cartItems![index]
                                                                            .quantity);
                                                                setState(() {});
                                                                decreaseItemQuantityInCartHandler(
                                                                    cart
                                                                        .cartItems![
                                                                            index]
                                                                        .id,
                                                                    cart
                                                                        .cartItems![
                                                                            index]
                                                                        .ticketId);
                                                              },
                                                        icon: Icon(
                                                            CupertinoIcons
                                                                .minus),
                                                        iconSize: 16),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    elevation: 5.0)),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            content: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                      'Please add quantity'),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  CustomTextField(
                                                                    hintText:
                                                                        'Add Quantity',
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .done,
                                                                    length: 2,
                                                                    type: TextInputType
                                                                        .number,
                                                                    controller:
                                                                        quantityControl,
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          addQuantityManuallyHandler(
                                                                              cart.cartItems![index].id,
                                                                              cart.cartItems![index].ticketId);
                                                                          cart.cartItems![index].quantity =
                                                                              int.parse(quantityControl.text);
                                                                        });
                                                                        Provider.of<CartItemsProvider>(context, listen: false).updateCartItems(
                                                                            index:
                                                                                index,
                                                                            qty:
                                                                                cart.cartItems![index].quantity);
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child: Text(
                                                                          "Save"))
                                                                ])));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4),
                                                    child: Text(
                                                        '${cart.cartItems![index].quantity}'
                                                            .toString()),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Card(
                                                  child: IconButton(
                                                    onPressed: () async {
                                                      cart.cartItems![index]
                                                          .quantity++;

                                                      Provider.of<CartItemsProvider>(
                                                              context,
                                                              listen: false)
                                                          .updateCartItems(
                                                              index: index,
                                                              qty: cart
                                                                  .cartItems![
                                                                      index]
                                                                  .quantity);

                                                      setState(() {});

                                                      CustomLoader.showLoader(
                                                          context: context,
                                                          message:
                                                              'Please wait');
                                                      await Future.delayed(
                                                          Duration(seconds: 1));

                                                      increaseItemsInCartHandler(
                                                          cart.cartItems![index]
                                                              .id,
                                                          cart.cartItems![index]
                                                              .ticketId);

                                                      setState(() {});
                                                      CustomLoader.hideLoader(
                                                          context);
                                                    },
                                                    icon: Icon(
                                                        CupertinoIcons.plus),
                                                    iconSize: 16,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  elevation: 5.0,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${double.parse(cart.cartItems![index].retail ?? "0").round() * cart.cartItems![index].quantity}\$',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                        Text(
                          "${cart.totalCalculatedPrice.round()}\$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Consumer<CartInvoiceNumberProvider>(
                  builder: (context, dataInvoice, _) {
                return SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                    onPressed: () async {
                      CustomLoader.showLoader(context: context);

                      await Future.delayed(Duration(seconds: 2));

                      CustomLoader.hideeLoader(context);

                      NavigationServices.goNextAndKeepHistory(
                          context: context, widget: CheckoutScreen());
                    },
                    // style: ElevatedButton.styleFrom(primary: Colors.orange),
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              })
            ],
          ),
        );
      }
    });
  }

  bool quantityValidation() {
    if (quantityControl.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: 'Enter Quantity');
      return false;
    } else {
      return true;
    }
  }

  Future<bool> popDialog() async {
    return await showCupertinoModalPopup(
        context: context,
        builder: (context) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Do you want to close your application?',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Divider(),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes')),
                      ],
                    )
                  ]),
                ),
              ),
            ));
  }
}
