import 'package:flutter/cupertino.dart';

import '../models/inventory_item_get_model.dart';

class InventoryItemProvider extends ChangeNotifier {
  List<ProductModel>? inventoryItems = [];

  updateInventory(
      {List<ProductModel>? newInventoryItems, bool isloadmore = false}) {
    inventoryItems = newInventoryItems;

    // if(isloadmore){
    //   inventoryItems!.addAll(newInventoryItems!);
    // }else {
    //   inventoryItems = newInventoryItems;
    //
    // }
    notifyListeners();
  }
}
