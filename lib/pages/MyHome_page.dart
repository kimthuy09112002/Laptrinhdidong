// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_8/pages/Home_page.dart';
// import 'SearchScreen_page.dart';
// import 'StatisticsScree_page.dart';
// import 'OrderCard_page.dart';
// import 'order_pages.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _quantityController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();

//   String _status = "Chưa thanh toán";

//   List<String> _statuses = ["Chưa thanh toán", "Đã thanh toán", "Xoá"];

//   List<Order> _orders = [
//     Order(
//         name: "John Doe",
//         quantity: 2,
//         price: 25.0,
//         status: "Chưa thanh toán",
//         date: DateTime.now()),
//     Order(
//         name: "Jane Doe",
//         quantity: 1,
//         price: 30.0,
//         status: "Đã thanh toán",
//         date: DateTime.now().subtract(Duration(days: 2))),
//     Order(
//         name: "Jack Smith",
//         quantity: 3,
//         price: 15.0,
//         status: "Xoá",
//         date: DateTime.now().subtract(Duration(days: 5))),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 300.0,
//               child: TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   hintText: 'Tên người dùng',
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 300.0,
//               child: TextField(
//                 controller: _quantityController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   hintText: 'Số lượng sách',
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 300.0,
//               child: TextField(
//                 controller: _priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   hintText: 'Giá tiền',
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 300.0,
//               child: DropdownButtonFormField<String>(
//                 value: _status,
//                 items: _statuses.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _status = value ?? '';
//                   });
//                 },
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _orders.add(Order(
//                       name: _nameController.text,
//                       quantity: int.parse(_quantityController.text),
//                       price: double.parse(_priceController.text),
//                       status: _status,
//                       date: DateTime.now()));
//                 });
//               },
//               child: Text('Thêm đơn hàng'),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _orders.length,
//                 itemBuilder: (BuildContext context, int index) => OrderCard(),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart),
//             label: 'Thống kê',
//           ),
//         ],
//         onTap: (index) {
//           switch (index) {
//             case 0:
//               break;
//             case 1:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => SearchScreen()));
//               break;
//             case 2:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => StatisticsScreen()));
//               break;
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'SearchScreen_page.dart';
import 'StatisticsScree_page.dart';
import 'OrderCard_page.dart';
import 'order_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sell Book Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sell Book Online'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Bill> _bills = <Bill>[];

  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String _showingTotal = "0.00";

  void _addBill(String name, int quantity, double price) {
    setState(() {
      _bills.add(Bill(quantity: quantity, price: price, name: name));
    });
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showTotal();
    }
  }

  void _showTotal() {
    double total = double.parse(_showingTotal) +
        int.parse(_quantityController.text) *
            double.parse(_priceController.text);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tổng Tiền'),
          content: Text('Total: \$${total.toStringAsFixed(2)}'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Lưu Thông Tin'),
              onPressed: () {
                _addBill(
                    _nameController.text,
                    int.parse(_quantityController.text),
                    double.parse(_priceController.text));
                _nameController.clear();
                _quantityController.clear();
                _priceController.clear();
                _showingTotal = "0.00";
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBillList() {
    return ListView.builder(
        itemCount: _bills.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(_bills[index].name),
            subtitle: Text(
                '${_bills[index].quantity} x ${_bills[index].price.toStringAsFixed(2)}'),
            trailing: Text(
                '${(_bills[index].quantity * _bills[index].price).toStringAsFixed(2)}'),
          );
        });
  }

  Widget _buildScrollToTopButton() {
    return FloatingActionButton(
      onPressed: () {
        _scrollController.animateTo(
          0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      },
      child: Icon(Icons.arrow_upward),
    );
  }

  void _handleScroll() {
    setState(() {
      _showScrollToTopButton =
          _scrollController.offset >= MediaQuery.of(context).size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          _showScrollToTopButton ? _buildScrollToTopButton() : null,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Tên Khách Hàng'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _quantityController,
                  decoration: InputDecoration(labelText: 'Số lượng sách'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a quantity';
                    }
                    final int? quantity = int.tryParse(value);
                    if (quantity == null || quantity <= 0) {
                      return 'Please enter a valid quantity';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price / 1 đơn vị'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    final double? price = double.tryParse(value);
                    if (price == null || price <= 0) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: Text('Thành tiền'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _bills.isEmpty
                ? Center(
                    child: Text('Không có hoá đơn'),
                  )
                : _buildBillList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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

class Bill {
  final String name;
  final int quantity;
  final double price;

  Bill({required this.name, required this.quantity, required this.price});
}
