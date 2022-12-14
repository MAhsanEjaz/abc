import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/item_get_sub_categories_provider.dart';

class ItemGetSubCategoriesService {
  Future itemGetSubCategories({
    required BuildContext context,
  }) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: getMoreSubCategoriesByCategoryUrl, context: context);

      if (res != null) {
        InventoryItemGetModel inventoryItemGetModel =
            InventoryItemGetModel.fromJson(res);
        Provider.of<ItemGetSubCategoriesProvider>(context, listen: false)
            .updateGetSubCategories(
                newGetSubCategories: inventoryItemGetModel.data!);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print('exception-------> $err');
      return false;
    }
  }
}
