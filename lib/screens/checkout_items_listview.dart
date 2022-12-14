import 'package:abc_cash_and_carry/helper_widgets/checkout_item_card.dart';
import 'package:abc_cash_and_carry/models/cart_model.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutItemsListview extends StatelessWidget {
  final List<CartItemModel>? cartItem;

  // final String totalCalculatedPrice;

  const CheckoutItemsListview({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: 60,
          //       child: Text('Preview'),
          //     ),
          //     Text('name'),
          //     Text('qty'),
          //     Text('amount \$'),
          //   ],
          // ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartItem!.length,
            itemBuilder: (context, index) {
              return CheckoutItemCard(
                inventoryItemData: cartItem![index],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping:',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text('0\$')
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 8.0,
                      right: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SubTotal:',
                          style: TextStyle(fontSize: 17),
                        ),
                        Consumer<CartItemsProvider>(
                            builder: (context, data, _) {
                          return Text(
                            '${data.totalCalculatedPrice.round()}\$',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 5, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(fontSize: 17),
                        ),
                        Consumer<CartItemsProvider>(
                            builder: (context, data, _) {
                          return Text(
                            '${data.totalCalculatedPrice.round()}\$',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
