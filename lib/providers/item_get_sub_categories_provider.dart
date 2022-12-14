import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/item_get_sub_caegories.dart';

class ItemGetSubCategoriesProvider extends ChangeNotifier {
  List<ProductModel>? getSubCategories = [];

  updateGetSubCategories(
      {required List<ProductModel>? newGetSubCategories}) {
    getSubCategories = newGetSubCategories;
    notifyListeners();
  }
}
