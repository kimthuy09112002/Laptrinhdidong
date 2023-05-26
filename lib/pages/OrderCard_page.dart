import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyHome_page.dart';
import 'order_pages.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Thông tin đơn hàng'),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                const snackBar = SnackBar(
                  content: Text('Đơn hàng đã được xóa'),
                );
              },
              child: const Text('Xoá'),
            ),
          ],
        ),
      ],
    );
  }
}

final List<Bill> _bills = <Bill>[];
@override
Widget build(BuildContext context) {
  var order;
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
  Card(
    margin: EdgeInsets.all(8.0),
    // child: ListTile(
    //   title: Text(order.name),
    //   subtitle: Text(
    //       'Số lượng: ${order.quantity}, Giá tiền: ${order.price}, Ngày mua: ${order.date.toString().substring(0, 10)}'),
    //   trailing: order.status == 'Xoá'
    //       ? IconButton(
    //           icon: Icon(Icons.delete),
    //           onPressed: () async {
    //             bool? status = await showDialog<bool>(
    //               context: context,
    //               builder: (BuildContext context) => AlertDialog(
    //                 title: const Text('😍'),
    //                 content: Row(
    //                   children: const [
    //                     Expanded(
    //                       child: Text(
    //                         'Bạn có muốn xóa không',
    //                         style: TextStyle(fontSize: 22.0),
    //                         textAlign: TextAlign.center,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 actions: [
    //                   TextButton(
    //                     onPressed: () => Navigator.pop(context, false),
    //                     child: const Text('Cancel'),
    //                   ),
    //                   TextButton(
    //                     onPressed: () => Navigator.pop(context, true),
    //                     child: const Text('OK'),
    //                   ),
    //                 ],
    //               ),
    //             );
    //             if (status ?? false) {
    //               SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    //             }
    //           },
    //         )
    //       : Text(order.status),
    // ),
  );
}
