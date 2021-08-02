import 'package:flutter/material.dart';
import 'package:project/providers/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItemTile extends StatefulWidget {
  final OrderItem orders;

  OrderItemTile(this.orders);

  @override
  _OrderItemTileState createState() => _OrderItemTileState();
}

class _OrderItemTileState extends State<OrderItemTile> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Rs. ${widget.orders.amount}'),
            subtitle: Text(
                DateFormat('dd-mm-yyyy hh:mm').format(widget.orders.dateTime)),
            trailing: IconButton(
              icon:
                  _expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              color: Colors.blue[50],
              height: min(widget.orders.product.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.orders.product
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              prod.title,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${prod.quantity}x Rs. ${prod.price}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
