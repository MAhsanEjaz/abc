// import 'package:abc_cash_and_carry/helper_widgets/placed_order_item_card.dart';
// import 'package:flutter/material.dart';
//
// class OrderPlacedItemsListview extends StatelessWidget {
//   final List<CartItemModel>? orderItems;
//
//  const OrderPlacedItemsListview({required this.orderItems});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//
//             Text('name'),
//             Text('qty'),
//             Text('amount \$'),
//           ],
//         ),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: orderItems!.length,
//           itemBuilder: (context, index) {
//             return PlacedOrderItemCard(
//               orderItem: orderItems![index],
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
