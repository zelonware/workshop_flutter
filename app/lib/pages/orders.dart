import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrdersPage extends StatelessWidget {
  final List<Order> orders;
  final DateFormat formatter = DateFormat('dd-MM-yyyy (HH:mm)');

  OrdersPage({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All your orders'),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.blueGrey,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Text(
                              '${orders[index].products} products for ${orders[index].total} 💶',
                              style: const TextStyle(color: Colors.white)),
                          Text(
                              'Ordered at ${formatter.format(orders[index].orderedAt)}',
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ));
                })));
  }
}
