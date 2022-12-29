import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/search_item_provider.dart';
import 'package:abc_cash_and_carry/screens/detail_screen.dart';
import 'package:abc_cash_and_carry/screens/search_screen.dart';
import 'package:abc_cash_and_carry/services/cart_invoice_number_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWrapScreen extends StatefulWidget {
  const SearchWrapScreen({Key? key}) : super(key: key);

  @override
  _SearchWrapScreenState createState() => _SearchWrapScreenState();
}

class _SearchWrapScreenState extends State<SearchWrapScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Consumer3<SearchItemProvider, CartItemsProvider,
        CartInvoiceNumberProvider>(builder: (context, data, cart, invoice, _) {
      List<Widget> widget = [];
      data.searchItem!.forEach((element) {
        widget.add(
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: InkWell(
                  onTap: () {
                    NavigationServices.goNextAndKeepHistory(
                        context: context,
                        widget: ProductDetailScreen(
                          inventoryItemData: element,
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5)),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(element.itemImageByPath ??
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcaxQL401fB8lgClXTuq6P_ld9fA7hyhShe4Wb9X5S68X-O-2cJVH9y0TAULpCZ3MwbNA&usqp=CAU'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 3),
                        child: SearchText(
                          text: element.name,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 4.0, vertical: 3),
                      //   child: SearchText(
                      //     text: element.brandName,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                        ),
                        child: SearchText(
                          text: element.categoryName.toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 4),
                        child: SearchText(
                          text: '${element.retail.toString()}\$',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onTap: () {
                          AddToCartService.addItemToCart(
                              product: element,
                              context: context,
                              quantity: 1,
                              ticketIDFromCartModel: cart.cartItems!.isEmpty
                                  ? invoice.cartInvoiceNumber.toString()
                                  : cart.cartItems![0].ticketId.toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
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
          ),
        );
      });
      return Wrap(
        children: widget,
      );
    });
  }
}

class SearchWrap1Screen extends StatefulWidget {
  const SearchWrap1Screen({Key? key}) : super(key: key);

  @override
  _SearchWrap1ScreenState createState() => _SearchWrap1ScreenState();
}

class _SearchWrap1ScreenState extends State<SearchWrap1Screen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchItemProvider>(builder: (context, data, _) {
      List<Widget> widget = [];
      data.searchItem!.forEach((element) {
        widget.add(
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: InkWell(
                  onTap: () {
                    NavigationServices.goNextAndKeepHistory(
                        context: context,
                        widget: ProductDetail1Screen(
                          inventoryItemData: element,
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5)),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://static.news.bitcoin.com/wp-content/uploads/2021/12/image-2021-12-09-100057.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 3),
                        child: SearchText(
                          text: element.name,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: SearchText(
                          text: element.brandName,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
      return Wrap(
        children: widget,
      );
    });
  }
}
