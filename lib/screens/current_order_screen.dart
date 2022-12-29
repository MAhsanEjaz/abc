import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_button.dart';
import 'package:abc_cash_and_carry/providers/current_order_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/services/current_product_service.dart';
import 'package:abc_cash_and_carry/services/reorder_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentOrderScreen extends StatefulWidget {
  String? ticketID;

  CurrentOrderScreen({this.ticketID});

  @override
  _CurrentOrderScreenState createState() => _CurrentOrderScreenState();
}

class _CurrentOrderScreenState extends State<CurrentOrderScreen> {
  getCurrentProduct() async {
    CustomLoader.showLoader(context: context);

    await GetCurrentProductService()
        .getCurrentProductService(context: context, ticketId: widget.ticketID);
    CustomLoader.hideeLoader(context);
  }

  reorderHandler(int userId, String ticketId) async {
    CustomLoader.showLoader(context: context);
    bool res = await ReOrderService()
        .reOrderService(context: context, ticketId: ticketId, id: userId);
    CustomLoader.hideeLoader(context);
    if (res) {
      NavigationServices.goNextAndDoNotKeepHistory(
          context: context, widget: CartScreen());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCurrentProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CurrentOrderProvider, UserDataProvider>(
        builder: (context, data, user, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Current Order'),
          ),
          body: SafeArea(
              child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.currentModel!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                              elevation: 5.0,
                                              child: Container(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                    Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(data
                                                                        .currentModel![
                                                                            index]
                                                                        .proImg ??
                                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcaxQL401fB8lgClXTuq6P_ld9fA7hyhShe4Wb9X5S68X-O-2cJVH9y0TAULpCZ3MwbNA&usqp=CAU'),
                                                                fit: BoxFit
                                                                    .fill))),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                            Container(
                                                              child: Text(
                                                                data
                                                                    .currentModel![
                                                                        index]
                                                                    .productName
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              width: 200,
                                                            ),
                                                            SizedBox(
                                                                height: 4.0),
                                                            Text(data
                                                                .currentModel![
                                                                    index]
                                                                .price
                                                                .toString()),
                                                            SizedBox(
                                                                height: 4.0),
                                                            Text(
                                                                'x${data.currentModel![index].quantity.toString().toUpperCase()}')
                                                          ])),
                                                    )
                                                  ]))));
                                    })
                              ]),
                        )))),

            // RichText(
            //     text: TextSpan(children: <TextSpan>[
            //   TextSpan(
            //       text: 'Cart Invoice No: ',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold, color: Colors.black)),
            //   TextSpan(
            //       text: data.currentModel![0].ticketId.toString(),
            //       style: TextStyle(color: Colors.black, fontSize: 12))
            // ])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyCustomButton(
                onPressed: () {
                  reorderHandler(user.user!.data!.id!,
                      data.currentModel![0].ticketId.toString());
                },
                child: 'Again Order',
              ),
            )
          ])));
    });
  }
}
