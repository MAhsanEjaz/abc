import 'package:abc_cash_and_carry/models/new_sub_category_drop_model.dart';
import 'package:flutter/material.dart';

class NewSubCategoryProvider extends ChangeNotifier {
  List<NewSubCategory>? category = [];

  getSubCategory({List<NewSubCategory>? newCategory}) {
    category = newCategory;
    notifyListeners();
  }
}
