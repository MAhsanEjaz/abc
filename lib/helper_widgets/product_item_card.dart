import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_services/page_route_service.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_login_dialog.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/screens/detail_screen.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:abc_cash_and_carry/services/cart_invoice_number_service.dart';
import 'package:abc_cash_and_carry/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class ProductItemCard extends StatefulWidget {
  ProductModel product;

  String? newTicket;

  ProductItemCard({required this.product, this.newTicket});

  @override
  State<ProductItemCard> createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  invoiceHandler() async {
    bool res = await CartInvoiceNumberService()
        .cartInvoiceNumberService(context: context);
    print(res);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    invoiceHandler();
  }

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartItemsProvider, CartInvoiceNumberProvider>(
        builder: (context, data, invoice, _) {
      return Card(
        color: Colors.white,
        elevation: 5.0,
        shadowColor: Colors.orange.shade50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5.0),
                topLeft: Radius.circular(5.0))),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          height: 300,
          width: 150,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              // go to product detail screen
              NavigationServices.goNextAndKeepHistory(
                  context: context,
                  widget:
                      ProductDetailScreen(inventoryItemData: widget.product));

              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return ProductDetailsScreen(product: product);
              // }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: widget.product.itemImageByPath == null
                        ? Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcaxQL401fB8lgClXTuq6P_ld9fA7hyhShe4Wb9X5S68X-O-2cJVH9y0TAULpCZ3MwbNA&usqp=CAU',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            gaplessPlayback: true,
                            isAntiAlias: true,
                          )
                        : Image.network(
                            widget.product.itemImageByPath.toString())),
                Divider(
                  thickness: 2,
                ),
                Container(
                  height: 20,
                  child: Text(
                    '${widget.product.name}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '\$ ${widget.product.retail}',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          AddToCartService.addItemToCart(
                            // ticketIDD: data.cartItems![0].ticketId.toString(),
                            context: context,
                            product: widget.product,
                            quantity: 1,
                            ticketIDFromCartModel: data.cartItems!.isEmpty
                                ? invoice.cartInvoiceNumber!
                                : data.cartItems![0].ticketId.toString(),
                          );
                        },
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.green,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class ProductItemCard1 extends StatelessWidget {
  ProductModel product;

  ProductItemCard1({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.orange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              10,
            ),
            topLeft: Radius.circular(10),
          ),
          side: BorderSide(color: Colors.black12)),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(5),
        height: 200,
        width: 150,
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            // go to product detail screen
            NavigationServices.goNextAndKeepHistory(
                context: context,
                widget: ProductDetail1Screen(inventoryItemData: product));

            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return ProductDetailsScreen(product: product);
            // }));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: product.itemImage == null
                      ? Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOQK249BZ1ew-naDnrnObIWfHwp8CnQGigvg&usqp=CAU',
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          product.itemImage ??
                              'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg',
                          fit: BoxFit.cover,
                        )),
              Divider(
                thickness: 2,
              ),
              Container(
                height: 15,
                child: Text(
                  '${product.name}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      // _loginBottomSheet(context);

                      PageRouteService.pageRoute(
                          context: context,
                          child: CustomLoginDialog(
                            emailControl: emailTextController,
                            passwordControl: passwordTextController,
                            onTap: () {
                              if (_validation(context)) _loginHandler(context);
                            },
                          ));
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.green,
                    )),
              ),
            ],
          ),
        ),
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

  _loginBottomSheet(BuildContext context) {
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
                    if (_validation(context)) {
                      _loginHandler(context);
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
