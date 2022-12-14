// import 'package:abc_cash_and_carry/helper_widgets/cart_item_card.dart';
// import 'package:abc_cash_and_carry/helper_widgets/suggested_item_card.dart';
// import 'package:abc_cash_and_carry/models/cart_model.dart';
// import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
// import 'package:abc_cash_and_carry/providers/products_provider.dart';
// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CartItemsListViewScreen extends StatefulWidget {
//   List<CartItemModel>? cartItems;
//
//   Function(int) deleteCartItems;
//
//   CartItemsListViewScreen(
//       {required this.cartItems, required this.deleteCartItems});
//
//   @override
//   _CartItemsListViewScreenState createState() =>
//       _CartItemsListViewScreenState();
// }
//
// class _CartItemsListViewScreenState extends State<CartItemsListViewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Consumer<ProductsProvider>(builder: (context, products, _) {
//           //   List<Widget> suggestedItem = [];
//           //
//           //   products.featuredProducts!.forEach((element) {
//           //     suggestedItem.add(SuggestedItemCard(
//           //       product: element,
//           //     ));
//           //   });
//           //
//           //   return Container(
//           //     height: 120,
//           //     child: CarouselSlider(
//           //       items: suggestedItem,
//           //       options: CarouselOptions(
//           //         height: 180.0,
//           //         enlargeCenterPage: false,
//           //         autoPlay: true,
//           //         aspectRatio: 1,
//           //         autoPlayCurve: Curves.fastOutSlowIn,
//           //         enableInfiniteScroll: true,
//           //         autoPlayAnimationDuration: Duration(milliseconds: 800),
//           //         viewportFraction: 0.3,
//           //       ),
//           //     ),
//           //   );
//           // }),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: widget.cartItems!.length,
//             itemBuilder: (context, index) {
//               return CartItemCard(
//                 inventoryItemData: widget.cartItems![index],
//                 onCancelPress: () {
//                   widget.deleteCartItems(index);
// //                    data.cartItem!.removeAt(index);
//                 },
//                 index: index,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
