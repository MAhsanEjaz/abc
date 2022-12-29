import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/screens/detail_screen.dart';
import 'package:abc_cash_and_carry/services/cart_invoice_number_service.dart';
import 'package:abc_cash_and_carry/services/item_get_by_sub_categories_item_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/item_get_by_sub_categories_item_provider.dart';

class ItemGetBySubCategoryIdScreen extends StatefulWidget {
  String? catId, name;

  ItemGetBySubCategoryIdScreen({this.catId, this.name});

  @override
  _ItemGetBySubCategoryIdScreenState createState() =>
      _ItemGetBySubCategoryIdScreenState();
}

class _ItemGetBySubCategoryIdScreenState
    extends State<ItemGetBySubCategoryIdScreen> {
  handler() async {
    CustomLoader.showLoader(context: context);

    await ItemGetBySubCategoryIDService()
        .itemGetBuSubCategoriesService(context: context, catId: widget.catId!);
    CustomLoader.hideeLoader(context);
  }

  invoiceHandler() async {
    bool res = await CartInvoiceNumberService()
        .cartInvoiceNumberService(context: context);
    print(res);
  }

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      handler();
      invoiceHandler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ItemGetBySubCategoryIDProvider, CartItemsProvider,
        CartInvoiceNumberProvider>(builder: (context, data, cart, invoice, _) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<CartItemsProvider>(builder: (context, data, _) {
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CartScreen();
                      }));
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    data.cartItems!.length.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              );
            }),
          ],
          title: Text(widget.name!),
        ),
        body: SingleChildScrollView(
          child: data.itemData!.isEmpty
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Text('Data not found'),
                ))
              : Consumer<ItemGetBySubCategoryIDProvider>(
                  builder: (context, data, _) {
                  List<Widget> widget = [];
                  data.itemData!.forEach((element) {
                    widget.add(SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 10.0,
                          child: InkWell(
                            onTap: () {
                              NavigationServices.goNextAndKeepHistory(
                                  context: context,
                                  widget: ProductDetailScreen(
                                      inventoryItemData: element));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(element
                                                  .itemImageByPath ??
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcaxQL401fB8lgClXTuq6P_ld9fA7hyhShe4Wb9X5S68X-O-2cJVH9y0TAULpCZ3MwbNA&usqp=CAU'),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: Text(
                                    element.name.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    element.categoryName.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    element.retail.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    AddToCartService.addItemToCart(
                                        context: context,
                                        // ticketIDD: data.cartItems![0].ticketId.toString(),
                                        product: element,
                                        quantity: 1,
                                        ticketIDFromCartModel:
                                            cart.cartItems!.isEmpty
                                                ? invoice.cartInvoiceNumber!
                                                : cart.cartItems![0].ticketId
                                                    .toString());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
                  });
                  return Align(
                      alignment: Alignment.center,
                      child: Wrap(children: widget));
                }),
        ),
      );
    });
  }
}

class ItemGetBySubCategoryIdScreen1 extends StatefulWidget {
  String? catId, name;

  ItemGetBySubCategoryIdScreen1({this.catId, this.name});

  @override
  _ItemGetBySubCategoryIdScreen1State createState() =>
      _ItemGetBySubCategoryIdScreen1State();
}

class _ItemGetBySubCategoryIdScreen1State
    extends State<ItemGetBySubCategoryIdScreen1> {
  handler() async {
    await CircularProgressIndicator();
    Future.delayed(
      Duration(seconds: 2),
    );

    ItemGetBySubCategoryIDService()
        .itemGetBuSubCategoriesService(context: context, catId: widget.catId!);
  }

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      handler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemGetBySubCategoryIDProvider>(
        builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.name!),
        ),
        body: SafeArea(
            child: data.itemData!.isEmpty
                ? Text('Data not found')
                : Consumer<ItemGetBySubCategoryIDProvider>(
                    builder: (context, data, _) {
                    List<Widget> widget = [];
                    data.itemData!.forEach((element) {
                      widget.add(SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 8.0,
                            child: InkWell(
                              onTap: () {
                                NavigationServices.goNextAndKeepHistory(
                                    context: context,
                                    widget: ProductDetail1Screen(
                                        inventoryItemData: element));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW_3Cpv7Ihl6PiFY9ICyEQcWwrSpghDV8cGA&usqp=CAU'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 5),
                                    child: Text(element.name.toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child:
                                        Text(element.categoryName.toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(element.cost.toString()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                    });
                    return Align(
                        alignment: Alignment.center,
                        child: Wrap(children: widget));
                  })),
      );
    });
  }
}
