import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/providers/inventory_itom_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryItemService {
  Future inventoryItemService({required BuildContext context,required int skipCount,required int getCount, bool isloadmore = false}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          // url: 'http://199.231.160.216/abcdwebapi/api/Inventory/ItemFetch',
          url: '${inventoryItemGet}?skipcount=${skipCount}&getcount=${getCount}',
          context: context);

      if (res != null) {
        InventoryItemGetModel inventoryItemGetModel =
            InventoryItemGetModel.fromJson(res);

        Provider.of<InventoryItemProvider>(context, listen: false)
            .updateInventory(newInventoryItems: inventoryItemGetModel.data, isloadmore: isloadmore);
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
