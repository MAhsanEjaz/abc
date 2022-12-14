import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/providers/item_get_by_sub_categories_item_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../config/api_urls.dart';
import '../models/item_get_by_sub_categories_item_model.dart';

class ItemGetBySubCategoryIDService {
  Future itemGetBuSubCategoriesService(
      {required BuildContext context, required String catId}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: getMoreSubCategoriesByCategoryUrlId + catId, context: context);
      if (res != null) {
        InventoryItemGetModel productModel =
            InventoryItemGetModel.fromJson(res);

        Provider.of<ItemGetBySubCategoryIDProvider>(context, listen: false)
            .updateData(newItemData: productModel.data);
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
