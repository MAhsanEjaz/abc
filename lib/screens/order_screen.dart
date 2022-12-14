import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/order_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/services/get_order_service.dart';
import 'package:abc_cash_and_carry/services/reorder_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_list_view.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int? userId;

  getOrderHandler() async {
    userId =
        Provider.of<UserDataProvider>(context, listen: false).user!.data!.id;
    OrderService().getOrderService(context: context, id: userId);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<OrderProvider,CartItemsProvider>(builder: (context, data,cart, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
        ),
        body: SafeArea(
          child: data.orderModel == null || data.orderModel!.isEmpty
              ? Center(child: Text('No Order'))
              : OrderListView(orderModel: data.orderModel!),

          //
          // data.orderModel!.isEmpty
          //     ? Center(child: Text('No Order'))
        ),
      );
    });
  }
}
