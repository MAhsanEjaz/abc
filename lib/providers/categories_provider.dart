import 'package:abc_cash_and_carry/models/categories_model.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  // List<Category>? categories = [];
  List<CatData>? categories = [];

  updateCategories({List<CatData>? newCategoris}) {
    categories = newCategoris;
    notifyListeners();
  }
}
