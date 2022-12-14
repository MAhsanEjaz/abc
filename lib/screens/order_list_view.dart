import 'package:abc_cash_and_carry/helper_widgets/order_card.dart';
import 'package:abc_cash_and_carry/models/get_order_model.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListView extends StatefulWidget {
  List<OrderModel> orderModel = [];

  OrderListView({required this.orderModel});

  @override
  _OrderListViewState createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemsProvider>(builder: (context, data, _) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.orderModel.length,
          itemBuilder: (context, index) {
            return OrderCard(
              orderModel: widget.orderModel[index],
            );
          });
    });
  }
}
