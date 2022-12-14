import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:flutter/material.dart';

//
// class BottomSheetHeader extends StatefulWidget {
//   final ProductModel product;
//
//   const BottomSheetHeader({required this.product});
//
//   @override
//   _BottomSheetHeaderState createState() => _BottomSheetHeaderState();
// }
//
// class _BottomSheetHeaderState extends State<BottomSheetHeader> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         // crossAxisAlignment: CrossAxisAlignment.,
//         children: [
//           widget.product.itemImage! == null
//               ? Image.asset(
//             'assets/images/placeholder.jpg',
//             width: 50,
//             height: 50,
//           )
//               : Image.network(
//             widget.product.itemImage == null
//                 ? 'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg'
//                 : widget.product.prodImages.toString(),
//             width: 100,
//             height: 100,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   widget.product.prodName ?? '',
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 // Spacer(),
//                 Text(
//                   '\$ ${widget.product.prodSalePrice}',
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class BottomSheetHader extends StatefulWidget {
  String? image, price, name;

  BottomSheetHader({
    this.image,
    this.name,
    this.price,
  });

  @override
  _BottomSheetHaderState createState() => _BottomSheetHaderState();
}

class _BottomSheetHaderState extends State<BottomSheetHader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image! == null
                              ? 'assets/images/placeholder.jpg'
                              : widget.image.toString()),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 170,
                        child: Text(
                          widget.name!,
                          style: TextStyle(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${widget.price!}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
