// import 'package:abc_cash_and_carry/providers/my_orders_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'custom_drawer.dart';
// import 'my_orders_listview_screen.dart';
//
// class MyOrdersScreen extends StatefulWidget {
//   @override
//   _MyOrdersScreenState createState() => _MyOrdersScreenState();
// }
//
// class _MyOrdersScreenState extends State<MyOrdersScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(),
//       appBar: AppBar(
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: new Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//             onPressed: () => Scaffold.of(context).openDrawer(),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: Text(
//           'My Orders',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Consumer<MyOrdersProvider>(builder: (context, orders, _) {
//         if (orders.myOrders!.isEmpty) {
//           return Scaffold(
//             body: Center(
//               child: Text('No Order'),
//             ),
//           );
//         } else {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 MyOrdersListviewScreen(orders: orders.myOrders!),
//
//                 // OrderPlacedItemsListview(orderItems:),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
