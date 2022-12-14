import 'package:abc_cash_and_carry/models/item_sub_category_model.dart';
import 'package:flutter/cupertino.dart';

class ItemSubCategoryProvider extends ChangeNotifier {
  List<SubCategories>? itemSubCategory = [];

  updateSubCategories({List<SubCategories>? newItemSubCategory}) {
    itemSubCategory = newItemSubCategory;


    notifyListeners();
  }
}
