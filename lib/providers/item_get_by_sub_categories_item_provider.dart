import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/item_get_by_sub_categories_item_model.dart';

class ItemGetBySubCategoryIDProvider extends ChangeNotifier {
  List<ProductModel>? itemData = [];

  updateData({List<ProductModel>? newItemData}) {
    itemData = newItemData;
    notifyListeners();
  }
}
