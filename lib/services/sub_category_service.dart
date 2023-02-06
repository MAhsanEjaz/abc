import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/item_sub_category_model.dart';
import 'package:abc_cash_and_carry/models/new_sub_category_drop_model.dart';
import 'package:abc_cash_and_carry/providers/item_sub_category_provider.dart';
import 'package:abc_cash_and_carry/providers/new_sub_category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SubCategoryService {
  Future getSubGategoriesByCatId({required BuildContext context}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: openItemSubCategoryGet, context: context);
      if (res != null) {
        SubCategory itemSubCategory = SubCategory.fromJson(res);

        Provider.of<NewSubCategoryProvider>(context, listen: false)
            .getSubCategory(newCategory: itemSubCategory.data);
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
