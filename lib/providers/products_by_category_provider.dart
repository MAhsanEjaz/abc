import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/models/products_by_category_model.dart';
import 'package:flutter/cupertino.dart';

class ProductsByCategoryProvider extends ChangeNotifier {
  List<ProductModel>? productsByCategory = [];

  getProducts({List<ProductModel>? newProductsByCategory}) {
    productsByCategory = newProductsByCategory;
    notifyListeners();
  }
}
