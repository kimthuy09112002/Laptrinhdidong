import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'MyHome_page.dart';
import 'OrderItem_page.dart';
import 'order_pages.dart';

class OrdersScreen extends StatelessWidget {
  final List<Order> orders;

  const OrdersScreen({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sắp xếp các đơn hàng theo thời gian giảm dần
    orders.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách đơn hàng'),
      ),
      body: orders.isEmpty
          ? Center(child: Text('Không có đơn hàng nào'))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderItem(order: order);
              },
            ),
    );
  }
}
