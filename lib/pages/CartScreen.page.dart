// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_8/pages/Home_page.dart';
// class CartScreen extends StatelessWidget {
//   final List<CartItem> cartItems;

//   const CartScreen({Key key, this.cartItems}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final sum = cartItems.fold<int>(0, (acc, currentItem) => acc + currentItem.product.price * currentItem.quantity);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Giỏ hàng'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartItems.length,
//               itemBuilder: (context, index) {
//                 final cartItem = cartItems[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('${cartItem.product.name}'),
//                       Text('${cartItem.quantity} x ${cartItem.product.price} đ'),
//                       Text('${cartItem.product.price * cartItem.quantity} đ'),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 8.0,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Tổng giá trị đơn hàng:'),
//                     Text('${sum.toString()} đ'),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 16.0,
//                 ),
//                 RaisedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CheckoutScreen(
//                           cartItems: cartItems,
//                           sum: sum,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text('Đặt hàng'),
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
