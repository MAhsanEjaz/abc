import 'package:flutter/cupertino.dart';

import '../models/get_order_model.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel>? orderModel = [];

  getOrder({List<OrderModel>? newOrderModel}) {
    orderModel = newOrderModel;
    notifyListeners();
  }
}
