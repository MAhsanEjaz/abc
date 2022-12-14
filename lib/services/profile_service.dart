import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/profile_provider.dart';

class ProfileService {
  Future profileService({required BuildContext context}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url:
              'http://199.231.160.216/abc.website.api/api/Security/CustomerProfileByID/6',
          context: context);

      if (res != null) {
        ProfileData profileModel = ProfileData.fromJson(res);

        Provider.of<ProfileProvider>(context, listen: false)
            .updateProfile(newProfileModel: profileModel);
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
