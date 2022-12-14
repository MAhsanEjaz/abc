import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/barcode_model.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BarcodeService {
  Future<ProductModel?> barcodeService(
  // Future<BarcodeData?> barcodeService(
      {required BuildContext context, String? itemBarCode}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: barcodeUrl + '?barcode=$itemBarCode', context: context);

      if (res != null) {
        BarcodeModel barcodeModel = BarcodeModel.fromJson(res);

        return barcodeModel.data;
      } else {
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
