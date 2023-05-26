import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'MyHome_page.dart';
import 'order_pages.dart';

class OrderDetail extends StatelessWidget {
  final Order order;

  const OrderDetail({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng #${order.id}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thông tin khách hàng',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Tên: ${order.name}'),
            SizedBox(height: 8.0),
            Text('Email: ${order.email}'),
            SizedBox(height: 8.0),
            Text('Số điện thoại: ${order.phone}'),
            SizedBox(height: 16.0),
            Text(
              'Thông tin đơn hàng',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Tổng giá trị đơn hàng: ${order.total} đ'),
            SizedBox(height: 8.0),
            Text('Ngày đặt hàng: ${order.date.toString().substring(0, 16)}'),
          ],
        ),
      ),
    );
  }
}
