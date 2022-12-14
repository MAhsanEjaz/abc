import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/item_sub_category_model.dart';
import 'package:abc_cash_and_carry/providers/item_sub_category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SubCategoryService {
  Future getSubGategoriesByCatId(
      {required BuildContext context, required String catId}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: getSubCategoriesByCategoryUrl + catId, context: context);
      if (res != null) {
        ItemSubCategory itemSubCategory = ItemSubCategory.fromJson(res);

        Provider.of<ItemSubCategoryProvider>(context, listen: false)
            .updateSubCategories(newItemSubCategory: itemSubCategory.data);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print('subCategories exception ------>$err');
      return false;
    }
  }
}
