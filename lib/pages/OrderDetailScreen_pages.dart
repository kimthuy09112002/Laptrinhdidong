import 'package:flutter/material.dart';
import 'SearchBar_page.dart';
import 'OrderCard_page.dart';
import 'order_pages.dart';
import 'StatisticsScree_page.dart';
import 'SearchScreen_page.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Thông tin đơn hàng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              title: Text('Tên người dùng'),
              subtitle: Text(order.name),
            ),
            ListTile(
              title: Text('Số lượng'),
              subtitle: Text(order.quantity.toString()),
            ),
            ListTile(
              title: Text('Giá tiền'),
              subtitle: Text(order.price.toString()),
            ),
            ListTile(
              title: Text('Ngày mua'),
              subtitle: Text(order.date.toString().substring(0, 10)),
            ),
            ListTile(
              title: Text('Trạng thái'),
              subtitle: Text(order.status),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: -1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Thống kê',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.popUntil(context, ModalRoute.withName('/'));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StatisticsScreen()));
              break;
          }
        },
      ),
    );
  }
}
