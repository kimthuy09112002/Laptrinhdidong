import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'MyHome_page.dart';
import 'Product_page.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    var description = product.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Text(description),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function() onAddToCart;

  const ProductItem(
      {Key? key, required this.product, required this.onAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.imageUrl as String,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${product.price} đ'),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: onAddToCart,
                child: Text('Đặt hàng'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
