import 'package:abc_cash_and_carry/providers/customer_profile_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/customer_profile_screen_view.dart';
import 'package:abc_cash_and_carry/services/customer_profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({Key? key}) : super(key: key);

  @override
  _CustomerProfileScreenState createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  int? id;

  getCustomerDataHandler() async {
    id = Provider.of<UserDataProvider>(context, listen: false).user!.data!.id;

    bool res = await CustomerProfileService()
        .customProfileService(context: context, id: id);

    print('response------> $res');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerDataHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProfileProvider>(builder: (context, data, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Profile'),
        ),
        body: SafeArea(
          child: data.customerProfileData == null
              ? Center(
                  child: CupertinoActivityIndicator(
                  radius: 13,
                ))
              : CustomerProfileScreenView(
                  customerProfileData: data.customerProfileData!),
        ),
      );
    });
  }
}
