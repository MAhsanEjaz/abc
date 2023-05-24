import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/models/cart_model.dart';
import 'package:abc_cash_and_carry/models/get_order_model.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/services/reorder_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatefulWidget {
  OrderModel orderModel;

  OrderCard({
    required this.orderModel,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String? ticketId;
  int? userId2;

  reOrderServiceHandler() async {
    ticketId = Provider.of<CartInvoiceNumberProvider>(context, listen: false)
        .cartInvoiceNumber;

    userId2 =
        Provider.of<UserDataProvider>(context, listen: false).user!.data!.id;

    bool order = await ReOrderService()
        .reOrderService(context: context, id: userId2, ticketId: ticketId);

    if (order == false) {
      CustomSnackBar.failedSnackBar(
          context: context, message: 'Please Check Information');
    } else {
      NavigationServices.goNextAndKeepHistory(
          context: context, widget: CartScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          style: ListTileStyle.drawer,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 60,
              width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHJpNGHiGGrz00K5q99icPExcEC6lZq5Er3g&usqp=CAU'),
                      fit: BoxFit.cover)),
            ),
          ),
          title: Text(
            widget.orderModel.productName == null
                ? 'Product'
                : widget.orderModel.productName.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
          ),
          subtitle: Row(
            children: [
              Text(
                'Quantity: ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                widget.orderModel.quantity == null
                    ? '1'
                    : widget.orderModel.quantity.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          trailing: Column(
            children: [
              widget.orderModel.isRejected == true
                  ? Text(
                      'Rejected',
                      style: TextStyle(color: Colors.red),
                    )
                  : Text(
                      'Pending',
                      style: TextStyle(color: Colors.green),
                    ),
              // Expanded(
              //   child: TextButton(
              //       onPressed: () async {
              //         CustomLoader.showLoader(context: context);
              //         await Future.delayed(Duration(seconds: 2));
              //         reOrderServiceHandler();
              //         CustomLoader.hideeLoader(context);
              //         // CustomSnackBar.showSnackBar(
              //         //     context: context,
              //         //     message: 'Yor order has been successful');
              //         //
              //         setState(() {});
              //       },
              //       child: Text('Reorder')),
              // ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.orderModel.orderDate.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
