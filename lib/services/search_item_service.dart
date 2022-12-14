import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/search_item_model.dart';
import 'package:abc_cash_and_carry/providers/search_item_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchItemService {
  Future itemSearch(
      {required BuildContext context, required String keyWord}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: '$searchItemUrl?name=$keyWord', context: context);
      if (res != null) {
        SearchItemModel searchItemModel = await SearchItemModel.fromJson(res);
        Provider.of<SearchItemProvider>(context, listen: false)
            .updateSearchItem(newSearchItem: searchItemModel.data);
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
