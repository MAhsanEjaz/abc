import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/providers/new_previous_order_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/screens/current_order_screen.dart';
import 'package:abc_cash_and_carry/services/previous_order_service.dart';
import 'package:abc_cash_and_carry/services/reorder_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrderNewScreen extends StatefulWidget {
  const MyOrderNewScreen({Key? key}) : super(key: key);

  @override
  _MyOrderNewScreenState createState() => _MyOrderNewScreenState();
}

class _MyOrderNewScreenState extends State<MyOrderNewScreen> {
  int? userId;

  getPreviousOrdersHandler() async {
    userId =
        Provider.of<UserDataProvider>(context, listen: false).user!.data!.id;

    CustomLoader.showLoader(context: context);

    await PreviousOrderService()
        .previousOrderService(context: context, userId: userId);
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
      getPreviousOrdersHandler();
    });
  }

  Future<void> orderRefresher() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getPreviousOrdersHandler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserDataProvider, NewPreviousOrderProvider>(
        builder: (context, user, data, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text('My Orders'),
          ),
          body: SafeArea(
              child: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: orderRefresher,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      data.previousOrders == null ||
                              data.previousOrders!.isEmpty
                          ? Center(
                              child: Padding(
                              padding: const EdgeInsets.only(top: 308.0),
                              child: Text('No Order'),
                            ))
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data.previousOrders!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          NavigationServices
                                              .goNextAndKeepHistory(
                                                  context: context,
                                                  widget: CurrentOrderScreen(
                                                      ticketID: data
                                                          .previousOrders![
                                                              index]
                                                          .ticketId
                                                          .toString()));
                                        },
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 1.0,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: Column(children: [
                                                  SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Invoice no:',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(data
                                                          .previousOrders![
                                                              index]
                                                          .ticketId
                                                          .toString()),
                                                    ],
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        data
                                                                    .previousOrders![
                                                                        index]
                                                                    .isRejected ==
                                                                true
                                                            ? Text('Rejected',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red))
                                                            : Text('Pending',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green)),
                                                        TextButton(
                                                            onPressed: () {
                                                              reorderHandler(

                                                                  user
                                                                      .user!
                                                                      .data!
                                                                      .id!,
                                                                  data
                                                                      .previousOrders![
                                                                          0]
                                                                      .ticketId
                                                                      .toString());
                                                            },
                                                            child: Text(
                                                                "Again Order")),
                                                      ])
                                                ])))),
                                    data.previousOrders![index].isRejected ==
                                            true
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0,
                                                        vertical: 3),
                                                child: Container(
                                                  height: 74,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ),
                                              Text(
                                                'Order OnHold'.toUpperCase(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              )
                                            ],
                                          )
                                        : Container()
                                  ],
                                );
                              })
                    ]))),
          )));
    });
  }
}
