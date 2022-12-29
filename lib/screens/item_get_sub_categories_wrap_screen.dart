import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_get_sub_categories_provider.dart';

class ItemGetSubCategoriesWrapScreenScreen extends StatefulWidget {
  const ItemGetSubCategoriesWrapScreenScreen({Key? key}) : super(key: key);

  @override
  _ItemGetSubCategoriesWrapScreenScreenState createState() =>
      _ItemGetSubCategoriesWrapScreenScreenState();
}

class _ItemGetSubCategoriesWrapScreenScreenState
    extends State<ItemGetSubCategoriesWrapScreenScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemGetSubCategoriesProvider>(builder: (context, data, _) {
      List<Widget> widget = [];
      data.getSubCategories!.forEach((element) {
        widget.add(ItemGetSubCategoriesWrapCard(
          product: element,
        ));
      });
      return Align(alignment: Alignment.center, child: Wrap(children: widget));
    });
  }
}

class ItemGetSubCategoriesWrapCard extends StatefulWidget {
  ProductModel? product;

  ItemGetSubCategoriesWrapCard({this.product});

  @override
  _ItemGetSubCategoriesWrapCardState createState() =>
      _ItemGetSubCategoriesWrapCardState();
}

class _ItemGetSubCategoriesWrapCardState
    extends State<ItemGetSubCategoriesWrapCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemsProvider>(builder: (context, data, _) {
      return Card(
        elevation: 5.0,
        shadowColor: Colors.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        )),
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
                  child: widget.product!.itemImage == null
                      ? Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOQK249BZ1ew-naDnrnObIWfHwp8CnQGigvg&usqp=CAU',
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          widget.product!.itemImage ??
                              'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg',
                          fit: BoxFit.cover,
                        ),
                ),
                Divider(
                  thickness: 2,
                ),
                Container(
                  height: 15,
                  child: Text(
                    '${widget.product!.name.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '\$ ${widget.product!.retail.toString()}',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          // widget.product!.stock?.quantity == '0' ||
                          //         widget.product!.stock?.quantity == null
                          //     ? CustomSnackBar.failedSnackBar(
                          //         context: context, message: 'Items out of Stock')
                          //
                          //
                          //     :

                          AddToCartService.addItemToCart(
                              context: context,
                              // ticketIDD: data.cartItems![0].ticketId.toString(),
                              product: widget.product!,
                              quantity: 1, ticketIDFromCartModel: data.cartItems![0].ticketId.toString());

                          setState(() {});
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

class ItemGetSubCategoriesWrapScreen1Screen extends StatefulWidget {
  const ItemGetSubCategoriesWrapScreen1Screen({Key? key}) : super(key: key);

  @override
  _ItemGetSubCategoriesWrapScreen1ScreenState createState() =>
      _ItemGetSubCategoriesWrapScreen1ScreenState();
}

class _ItemGetSubCategoriesWrapScreen1ScreenState
    extends State<ItemGetSubCategoriesWrapScreen1Screen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemGetSubCategoriesProvider>(builder: (context, data, _) {
      List<Widget> widget = [];
      data.getSubCategories!.forEach((element) {
        widget.add(ItemGetSubCategoriesWrapCard1(
          product: element,
        ));
      });
      return Align(
        alignment: Alignment.center,
        child: Wrap(
          children: widget,
        ),
      );
    });
  }
}

class ItemGetSubCategoriesWrapCard1 extends StatefulWidget {
  ProductModel? product;

  ItemGetSubCategoriesWrapCard1({this.product});

  @override
  _ItemGetSubCategoriesWrapCard1State createState() =>
      _ItemGetSubCategoriesWrapCard1State();
}

class _ItemGetSubCategoriesWrapCard1State
    extends State<ItemGetSubCategoriesWrapCard1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            10,
          ),
          topLeft: Radius.circular(10),
        ),
      ),
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
                widget:
                    ProductDetail1Screen(inventoryItemData: widget.product));

            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return ProductDetailsScreen(product: product);
            // }));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: widget.product!.itemImage == null
                    ? Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOQK249BZ1ew-naDnrnObIWfHwp8CnQGigvg&usqp=CAU',
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        widget.product!.itemImage ??
                            'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg',
                        fit: BoxFit.cover,
                      ),
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                height: 15,
                child: Text(
                  '${widget.product!.name.toString()}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
