import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'MyHome_page.dart';
import 'OrderDetailScreen_pages.dart';
import 'order_pages.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderDetailScreen(order: order)));
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đơn hàng #${order.id}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 8.0),
                  Text(order.name),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 8.0),
                  Text(order.email),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 8.0),
                  Text(order.date.toString().substring(0, 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
