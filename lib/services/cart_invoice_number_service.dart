import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/cart_invoice_number_model.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartInvoiceNumberService {
  Future cartInvoiceNumberService({required BuildContext context}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: cartInvoiceNumberUrl, context: context);

      if (res != null) {
        CartInvoiceNumberModel? cartInvoiceNumberModel =
            CartInvoiceNumberModel.fromJson(res);

        print('cartInvoiceNo------>${cartInvoiceNumberModel.data!.invoiceNo!}');

        await Provider.of<CartInvoiceNumberProvider>(context, listen: false)
            .updateCartInvoiceNumber(
                newCartInvoiceNumberModel: cartInvoiceNumberModel.data!.invoiceNo!);
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
