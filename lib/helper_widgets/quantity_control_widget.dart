import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityControlWidget extends StatefulWidget {
  Function(double, int) onDecremeant; // (price , quantity)
  Function(double, int) onIncremeant; // (price , quantity)
  int quantity;
  double price;

  QuantityControlWidget(
      {required this.onDecremeant,
      required this.onIncremeant,
      required this.quantity,
      required this.price});

  @override
  _QuantityControlWidgetState createState() => _QuantityControlWidgetState();
}

class _QuantityControlWidgetState extends State<QuantityControlWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: (widget.quantity < 2)
                  ? null
                  : () {
                      setState(() {
                        widget.quantity--;
                        widget.onDecremeant(
                            widget.price * widget.quantity, widget.quantity);
                      });
                    },
              icon: Icon(
                CupertinoIcons.minus,
              ),
            ),
            Text('${widget.quantity}'),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.quantity++;
                  widget.onIncremeant(
                      widget.price * widget.quantity, widget.quantity);
                });
              },
              icon: Icon(
                CupertinoIcons.add,
                size: 17,
              ),
            ),
            Expanded(child: Text(' \$ ${widget.price * widget.quantity}')),
          ],
        ),
      ),
    );
  }
}
