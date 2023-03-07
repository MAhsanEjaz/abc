import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_textfield.dart';
import 'package:abc_cash_and_carry/models/customer_profile_model.dart';
import 'package:abc_cash_and_carry/models/user_model.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/services/customer_profile_service.dart';
import 'package:abc_cash_and_carry/services/profile_update_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerProfileScreenView extends StatefulWidget {
  CustomerProfileData? customerProfileData;

  CustomerProfileScreenView({required this.customerProfileData});

  @override
  _CustomerProfileScreenViewState createState() =>
      _CustomerProfileScreenViewState();
}

class _CustomerProfileScreenViewState extends State<CustomerProfileScreenView> {
  int? id;

  getCustomerDataHandler() async {
    id = Provider.of<UserDataProvider>(context, listen: false).user!.data!.id;

    bool res = await CustomerProfileService()
        .customProfileService(context: context, id: id);

    print('response------> $res');
  }

  TextEditingController fullNameControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();
  TextEditingController addressControl = TextEditingController();

  updateProfileHandler() async {
    CustomLoader.showLoader(context: context);
    UserModel? userId;
    userId = Provider.of<UserDataProvider>(context, listen: false).user!;

    bool res = await ProfileUpdateService().profileUpdateService(
        context: context,
        id: userId.data!.id!,
        email: userId.data!.email!,
        phone: phoneControl.text,
        fullName: fullNameControl.text,
        ownerAddress: addressControl.text);

    getCustomerDataHandler();

    print('message-----> $res');

    CustomLoader.hideLoader(context);

    if (res) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerDataHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.black12)),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Align(
                                          alignment: Alignment.center,
                                          child: Text('Edit your profile')),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomTextField(
                                            hintText: 'Full Name',
                                            controller: fullNameControl,
                                          ),
                                          CustomTextField(
                                            type: TextInputType.number,
                                            hintText: 'Phone',
                                            controller: phoneControl,
                                          ),
                                          CustomTextField(
                                            hintText: 'Address',
                                            controller: addressControl,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: MyCustomButton(
                                              onPressed: () {
                                                updateProfileHandler();
                                              },
                                              child: 'Update',
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.edit),
                            ),
                          ),
                        ),
                      ),
                      ProfileText(
                        text: 'Full Name',
                      ),
                      Text(
                        widget.customerProfileData!.fullName ?? 'Name',
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(),
                      ProfileText(
                        text: 'Email',
                      ),
                      Text(
                        widget.customerProfileData!.email ?? 'Email',
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(),
                      ProfileText(
                        text: 'Phone',
                      ),
                      Text(
                        widget.customerProfileData!.phone ?? 'Phone',
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(),
                      ProfileText(
                        text: 'Address',
                      ),
                      Text(
                        widget.customerProfileData!.ownerAddress ?? 'Address',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class DialogData extends StatefulWidget {
//   const DialogData({Key? key}) : super(key: key);
//
//   @override
//   _DialogDataState createState() => _DialogDataState();
// }
//
// class _DialogDataState extends State<DialogData> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class ProfileText extends StatefulWidget {
  String? text;

  ProfileText({this.text});

  @override
  _ProfileTextState createState() => _ProfileTextState();
}

class _ProfileTextState extends State<ProfileText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        widget.text!,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 23, letterSpacing: 1),
      ),
    );
  }
}
