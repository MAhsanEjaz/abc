import 'package:abc_cash_and_carry/models/new_previous_order_model.dart';
import 'package:flutter/cupertino.dart';

class NewPreviousOrderProvider extends ChangeNotifier {
  List<PreviousOrder>? previousOrders = [];

  getPreviousOrders({List<PreviousOrder>? newPreviousOrders}) {
    previousOrders = newPreviousOrders;
    notifyListeners();
  }
}
