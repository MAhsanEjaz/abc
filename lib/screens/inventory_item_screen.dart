import 'package:abc_cash_and_carry/helper_widgets/product_item_card.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/inventory_itom_provider.dart';
import 'package:abc_cash_and_carry/services/inventory_item_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryItemScreen extends StatefulWidget {
  const InventoryItemScreen({Key? key}) : super(key: key);

  @override
  _InventoryItemScreenState createState() => _InventoryItemScreenState();
}

class _InventoryItemScreenState extends State<InventoryItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<InventoryItemProvider, CartItemsProvider>(
        builder: (context, data, cart, _) {
      if (data.inventoryItems!.isEmpty || data.inventoryItems == null) {
        return Container(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Container());
      } else {
        List<Widget> widget = [];
        data.inventoryItems!.forEach((element) {
          widget.add(ProductItemCard(
            product: element,
          ));
        });
        return Wrap(
          children: widget,
        );
      }
    });
  }
}

class InventoryItemScreen1 extends StatefulWidget {
  const InventoryItemScreen1({Key? key}) : super(key: key);

  @override
  _InventoryItemScreen1State createState() => _InventoryItemScreen1State();
}

class _InventoryItemScreen1State extends State<InventoryItemScreen1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryItemProvider>(builder: (context, data, _) {
      List<Widget> widget = [];
      data.inventoryItems!.forEach((element) {
        widget.add(data.inventoryItems!.isEmpty
            ? CircularProgressIndicator()
            : ProductItemCard1(
                product: element,
              ));
      });
      return Align(
        alignment: Alignment.center,
        child: Wrap(
          children: widget,
        ),
      );
    });
  }
}
