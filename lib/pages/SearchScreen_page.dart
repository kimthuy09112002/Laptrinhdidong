import 'package:flutter/material.dart';
import 'order_pages.dart';
import 'StatisticsScree_page.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  List<Order> _orders = [
    Order(
        name: "John Doe",
        quantity: 2,
        price: 25.0,
        status: "Chưa thanh toán",
        date: DateTime.now()),
    Order(
        name: "Jane Doe",
        quantity: 1,
        price: 30.0,
        status: "Đã thanh toán",
        date: DateTime.now().subtract(Duration(days: 2))),
    Order(
        name: "Jack Smith",
        quantity: 3,
        price: 15.0,
        status: "Xoá",
        date: DateTime.now().subtract(Duration(days: 5))),
  ];

  List<Order> _searchResult = [];

  void _onSearchTextChanged(String text) {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _orders.forEach((order) {
      if (order.name.toLowerCase().contains(text.toLowerCase()) ||
          order.status.toLowerCase().contains(text.toLowerCase()) ||
          order.date.toString().substring(0, 10).contains(text)) {
        _searchResult.add(order);
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 300.0,
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
              ),
              onChanged: _onSearchTextChanged,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResult[index].name),
                  subtitle: Text(
                      'Số lượng: ${_searchResult[index].quantity}, Giá tiền: ${_searchResult[index].price}, Ngày mua: ${_searchResult[index].date.toString().substring(0, 10)}'),
                  trailing: Text(_searchResult[index].status),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
