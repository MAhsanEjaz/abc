import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/categories_model.dart';
import 'package:abc_cash_and_carry/providers/categories_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CategoriesApiServices {
  Future getAllCategories({required BuildContext context}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: getAllCategoriesUrl, context: context);

      if (res != null) {
        Category categoriesModel = Category.fromJson(res);
        Provider.of<CategoriesProvider>(context, listen: false)
            .updateCategories(newCategoris: categoriesModel.data);
        // provider data storage
        // remember user logged in

        return true;
      } else {
        return false;
      }
    } catch (err) {
      print('exception in loginApiService --> $err');
      return false;
    }
  }
}
