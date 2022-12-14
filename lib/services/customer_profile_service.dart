import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/customer_profile_model.dart';
import 'package:abc_cash_and_carry/providers/customer_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomerProfileService {
  Future customProfileService({required BuildContext context, int? id}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: getCustomerDataUrl+'$id', context: context);

      if (res != null) {
        CustomerProfileModel customerProfileData =
            CustomerProfileModel.fromJson(res);

        Provider.of<CustomerProfileProvider>(context, listen: false)
            .getCustomerData(newCustomerProfileData: customerProfileData.data);
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
