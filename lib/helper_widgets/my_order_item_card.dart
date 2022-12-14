import 'package:abc_cash_and_carry/models/cart_model.dart';
import 'package:flutter/material.dart';

class MyOrderItemCard extends StatelessWidget {
  CartItemModel orderItem;

  MyOrderItemCard({required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.black26),
      //   borderRadius: BorderRadius.circular(15.0),
      // ),
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
     // padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //     width:70,child: Text('${orderItem.product!.prodName}',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.normal),)),
          // Text('\$ ${orderItem.product!.prodSalePrice} X ${orderItem.quantity}',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
          // Text("\$ ${orderItem.totalPrice}",style: TextStyle(fontSize: 16.0),)
        ],
      ),
    );
  }
}