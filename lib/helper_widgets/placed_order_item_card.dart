import 'package:flutter/material.dart';

class PlacedOrderItemCard extends StatelessWidget {
  // CartItemModel orderItem;
  //
  // PlacedOrderItemCard({required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   width:70,
                //   child: Text(
                //     orderItem.product!.prodName.toString(),
                //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                //   ),
                // ),
                // Text(
                //   '${orderItem.quantity.toString()}  X \$${orderItem.product!.prodSalePrice.toString()}',style: TextStyle(fontWeight: FontWeight.w400),),
                // Text('\$${orderItem.totalPrice.toString()}',style: TextStyle(fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.orange,
        )
      ],
    );
  }
}