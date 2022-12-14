import 'package:abc_cash_and_carry/models/cart_model.dart';
import 'package:flutter/material.dart';


class CheckoutItemCard extends StatelessWidget {
  // final CartModel cartItem;

  CartItemModel? inventoryItemData;

  CheckoutItemCard({required this.inventoryItemData});

  // void initState() {
  //   cartItemPrice = cartItem.totalPrice!;
  //   quantity = cartItem.quantity!;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.orange)),
          elevation: 10,
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 60,
                  height: 105,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      // cartItem.product!.prodImage.toString(),
                      inventoryItemData!.imagePath ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfTDL4eFW-ISJtNFLFMBWXgM8Icd62vPrazQ&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                title: Text(inventoryItemData!.name.toString()),
                subtitle: Text(

                  'Item Price: \$${inventoryItemData!.retail.toString()}',
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Text(
                  'Qty: ${inventoryItemData!.quantity.toString()}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                color: Colors.orange,
              ),
              ButtonBar(
                children: [
                  Text('${inventoryItemData!.quantity} item(s)'),
                  Text(
                    'Total Price. ${double.parse(
                        inventoryItemData!.retail.toString()).round() *
                        inventoryItemData!.quantity}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
