import 'package:abc_cash_and_carry/models/current_order_model.dart';
import 'package:flutter/cupertino.dart';

class CurrentOrderProvider extends ChangeNotifier {
  List<CurrentModel>? currentModel = [];

  getCurrentProduct({List<CurrentModel>? newCurrentModel}) {
    currentModel = newCurrentModel;
    notifyListeners();
  }
}
