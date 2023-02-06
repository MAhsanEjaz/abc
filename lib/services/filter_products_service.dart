import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/filter_model.dart';
import 'package:abc_cash_and_carry/providers/filter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FilterProductsService {
  Future filterProductsService(
      {required BuildContext context, String? name}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: '$filterUrl' + name!, context: context);

      if (res != null) {
        FilterModel filterModel = FilterModel.fromJson(res);

        Provider.of<FilterProvider>(context, listen: false)
            .getProducts(newProducts: filterModel.data);
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
