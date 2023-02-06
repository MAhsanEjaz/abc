import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/models/products_by_category_model.dart';
import 'package:abc_cash_and_carry/providers/item_get_by_sub_categories_item_provider.dart';
import 'package:abc_cash_and_carry/providers/products_by_category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../config/api_urls.dart';

class ItemGetBySubCategoryIDService {
  Future itemGetBuSubCategoriesService(
      {required BuildContext context,
      required String id,
      required String name}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: '$productsByCategory?name=$name&id=$id', context: context);
      if (res != null) {
        ProductByCategoryModel productModel =
            ProductByCategoryModel.fromJson(res);

        Provider.of<ProductsByCategoryProvider>(context, listen: false)
            .getProducts(newProductsByCategory: productModel.data);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
