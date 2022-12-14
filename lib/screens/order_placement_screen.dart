// import 'package:abc_cash_and_carry/models/cart_items_model.dart';
// import 'package:abc_cash_and_carry/models/my_order_model.dart';
// import 'package:abc_cash_and_carry/services/my_orders_services.dart';
// import 'package:flutter/material.dart';
//
// import 'order_placed_items_listview.dart';
//
// class OrderPlacementScreen extends StatefulWidget {
//   List<CartItemModel>? orderItems;
//   String deliveryDate;
//
//   OrderPlacementScreen({this.orderItems, required this.deliveryDate});
//
//   @override
//   _OrderPlacementScreenState createState() => _OrderPlacementScreenState();
// }
//
// class _OrderPlacementScreenState extends State<OrderPlacementScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '#ORDER1234',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text('Order has been placed'),
//             OrderPlacedItemsListview(
//               orderItems: widget.orderItems,
//             ),
//             Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(1),
//                   side: BorderSide(color: Colors.black)),
//               elevation: 10,
//               child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text('Delivery date : ${widget.deliveryDate}',
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'order_placed_items_listview.dart';

// class OrderPlacementScreen extends StatefulWidget {
//   // List<CartItemModel>? orderItems;
//   List<CartModel>? orderItems;
//
//   String? deliveryDate;
//   String? orderDate;
//   String? orderID;
//   String? orderNotes;
//
//   OrderPlacementScreen(
//       {this.orderItems,
//       this.deliveryDate,
//       this.orderDate,
//       this.orderID,
//       this.orderNotes});
//
//   @override
//   _OrderPlacementScreenState createState() => _OrderPlacementScreenState();
// }
//
// class _OrderPlacementScreenState extends State<OrderPlacementScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: InkWell(
//         //     onTap: () {
//         //       Navigator.pop(context);
//         //     },
//         //     child: Icon(
//         //       Icons.home_outlined,
//         //       color: Colors.black,
//         //     )),
//         title: Text(
//           '${widget.orderID}',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Order has been placed',
//                   style: TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text('Order Date : '),
//                   Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(1),
//                         side: BorderSide(color: Colors.black)),
//                     elevation: 10,
//                     child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           // width: MediaQuery.of(context).size.width,
//                           child: Text('${widget.orderDate}',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                         )),
//                   ),
//                 ],
//               ),
//               // OrderPlacedItemsListview(
//               //   orderItems: widget.orderItems,
//               // ),
//               Consumer2<UserDataProvider, CartProvider>(
//                   builder: (context, user, cart, _) {
//                 return Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(
//                       side: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Shipping:',
//                               style: TextStyle(fontSize: 20, color: Colors.red),
//                             ),
//                             Text(
//                               '0',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Discount:',
//                               style: TextStyle(fontSize: 20, color: Colors.red),
//                             ),
//                             Text(
//                               '0',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Total:',
//                               style: TextStyle(fontSize: 20, color: Colors.red),
//                             ),
//                             Text(
//                               '\$${cart.ttotallCalculatedPrice.toString()}',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(1),
//                     side: BorderSide(color: Colors.black)),
//                 elevation: 10,
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: Text('Delivery date : ${widget.deliveryDate}',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     )),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
//                 child: Text(
//                   'Address',
//                   style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child:
//                     Text('DHA Main Office Complex ڈی ایچ اے مین آفس کمپلیکس '),
//               ),
//               (widget.orderNotes != null && widget.orderNotes!.isNotEmpty)
//                   ? Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: Text(
//                         'Notes',
//                         style: TextStyle(
//                             fontSize: 19, fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   : SizedBox(),
//               (widget.orderNotes != null && widget.orderNotes!.isNotEmpty)
//                   ? Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: Text('${widget.orderNotes}'),
//                     )
//                   : SizedBox()
//             ],
//           ),
//         ),
//       ),
//       persistentFooterButtons: [
//         SizedBox(
//           width: double.infinity,
//           height: 45,
//           child: ElevatedButton(
//             onPressed: () {
//               // Provider.of<CartItemsProvider>(context,listen: false).emptyCartItems();
//               Provider.of<CartProvider>(context, listen: false)
//                   .emptyCartItems();
//               NavigationServices.goNextAndDoNotKeepHistory(
//                   context: context, widget: HomeScreen());
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.orange),
//             child: Text('Continue Shopping'),
//           ),
//         )
//       ],
//     );
//   }
// }
