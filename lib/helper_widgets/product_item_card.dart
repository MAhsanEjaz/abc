import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_services/page_route_service.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_login_dialog.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/screens/detail_screen.dart';
import 'package:abc_cash_and_carry/screens/zoom.dart';
import 'package:abc_cash_and_carry/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class ProductItemCard extends StatelessWidget {
  ProductModel product;

  String? newTicket;

  ProductItemCard({required this.product, this.newTicket});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemsProvider>(builder: (context, data, _) {
      return Card(
        elevation: 5.0,
        shadowColor: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10))),
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(5),
          height: 280,
          width: 150,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              // go to product detail screen
              NavigationServices.goNextAndKeepHistory(
                  context: context,
                  widget: ProductDetailScreen(inventoryItemData: product));

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
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.network(product.itemImage.toString())),
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '\$ ${product.retail}',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          AddToCartService.addItemToCart(
                            // ticketIDD: data.cartItems![0].ticketId.toString(),
                            context: context,
                            product: product,
                            quantity: 1,
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
