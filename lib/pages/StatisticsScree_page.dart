import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'order_pages.dart';
import 'SearchScreen_page.dart';

class StatisticsScreen extends StatelessWidget {
  List<Order> _orders = [
    // Order(
    //     name: "John Doe",
    //     quantity: 2,
    //     price: 25.0,
    //     status: "Chưa thanh toán",
    //     date: DateTime.now()),
    // Order(
    //     name: "Jane Doe",
    //     quantity: 1,
    //     price: 30.0,
    //     status: "Đã thanh toán",
    //     date: DateTime.now().subtract(Duration(days: 2))),
    // Order(
    //     name: "Jack Smith",
    //     quantity: 3,
    //     price: 15.0,
    //     status: "Xoá",
    //     date: DateTime.now().subtract(Duration(days: 5))),
  ];

  double _totalPrice() {
    double sum = 0.0;
    for (int i = 0; i < _orders.length; i++) {
      sum += _orders[i].price * _orders[i].quantity;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics Screen"),
      ),
      body: ListView.builder(
        itemCount: _orders.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return ListTile(
              title: Text('Tổng tiền: ${_totalPrice()}'),
            );
          }
          index--;
          return ListTile(
            title: Text(_orders[index].name),
            subtitle: Text(
                'Số lượng: ${_orders[index].quantity}, Giá tiền: ${_orders[index].price}, Ngày mua: ${_orders[index].date.toString().substring(0, 10)}'),
            trailing: Text(_orders[index].status),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
              break;
          }
        },
      ),
    );
  }
}
