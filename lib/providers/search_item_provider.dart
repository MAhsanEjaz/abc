import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/models/search_item_model.dart';
import 'package:flutter/cupertino.dart';

class SearchItemProvider extends ChangeNotifier {
  List<ProductModel>? searchItem = [];

  updateSearchItem({List<ProductModel>? newSearchItem}) {
    searchItem = newSearchItem;
    notifyListeners();
  }
}
