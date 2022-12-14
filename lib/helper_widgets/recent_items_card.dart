// import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
// import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
// import 'package:abc_cash_and_carry/models/products_model.dart';
// import 'package:abc_cash_and_carry/screens/product_details_screen.dart';
// import 'package:flutter/material.dart';
//
// class RecentItemCard extends StatelessWidget {
//   ProductItem product;
//
//   RecentItemCard({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shadowColor: Colors.orange,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(
//               10,
//             ),
//             topLeft: Radius.circular(10),
//           ),
//           side: BorderSide(color: Colors.black12)),
//       child: Container(
//         // padding: EdgeInsets.all(8),
//         margin: EdgeInsets.all(5),
//         height: 100,
//         width: 100,
//         alignment: Alignment.center,
//         child: InkWell(
//           onTap: () {
//             // go to product detail screen
//             NavigationServices.goNextAndKeepHistory(
//                 context: context,
//                 widget: ProductDetailsScreen(product: product));
//
//             // Navigator.push(context, MaterialPageRoute(builder: (context) {
//             //   return ProductDetailsScreen(product: product);
//             // }));
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                   child: product.prodImages == null
//                       ? Image.asset('assets/placeholder.jpg')
//                       : Image.network(
//                           product.prodImage ??
//                               'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg',
//                           fit: BoxFit.cover,
//                         )),
//               SizedBox(
//                 height: 10,
//                 child: Text(
//                   '${product.prodName}',
//                   style: TextStyle(
//                       height: 0.9, fontSize: 12, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       '\$ ${product.prodSalePrice}',
//                       style: TextStyle(fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   InkWell(
//                       onTap: () {
//                         AddToCartService.addItemToCart(
//                             context: context, product: product, quantity: 1);
//                       },
//                       child: Icon(
//                         Icons.add_shopping_cart,
//                         color: Colors.green,
//                       )),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
