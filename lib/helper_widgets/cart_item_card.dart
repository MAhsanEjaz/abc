import 'package:abc_cash_and_carry/helper_widgets/quantity_control_widget.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatefulWidget {
  // final CartItemModel cartItem;

  ProductModel? inventoryItemData;
  final Function() onCancelPress;
  final int index;

  CartItemCard(
      {this.inventoryItemData,
      required this.onCancelPress,
      required this.index});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  double cartItemPrice = 0;
  int quantity = 1;

  // @override
  // void initState() {
  //   super.initState();
  //   cartItemPrice = widget.cartItem.totalPrice!;
  //   quantity = widget.cartItem.quantity!;
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  widget.inventoryItemData!.itemImage ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(widget.inventoryItemData!.name!),
            subtitle: Text(
              '\$ ${widget.inventoryItemData!.retail.toString()}',
              style: TextStyle(color: Colors.red),
            ),
            trailing: Column(
              children: [
                Tooltip(
                  message: 'Delete Item From Cart',
                  child: IconButton(
                      onPressed: () {
                        widget.onCancelPress();
                      },
                      icon: Icon(
                        CupertinoIcons.delete,
                        color: Colors.orange,
                      )),
                ),
              ],
            ),
          ),
          QuantityControlWidget(
            onDecremeant: (price, qty) {
              cartItemPrice = price;
              quantity = qty;
              print('decremeant -- price : $cartItemPrice  quantity $quantity');
              Provider.of<CartItemsProvider>(context, listen: false)
                  .updateCartItems(index: widget.index, qty: quantity);
            },
            onIncremeant: (price, qty) {
              cartItemPrice = price;
              quantity = qty;
              print(
                  'onIncremeant -- price : $cartItemPrice  quantity $quantity');
              Provider.of<CartItemsProvider>(context, listen: false)
                  .updateCartItems(index: widget.index, qty: quantity);
            },
            quantity: quantity,
            price: double.parse(widget.inventoryItemData!.retail ?? '0'),
          ),
        ],
      ),
    );
  }
}
