import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  List<ProductModel>? products = [];

  getProducts({List<ProductModel>? newProducts}) {
    products = newProducts;
    notifyListeners();
  }
}
