import 'package:finalproject/provider/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartproductScreen extends StatelessWidget {
  final Cart cart;

  const CartproductScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in Cart ${cart.id}',style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: ListView.builder(
        itemCount: cart.products?.length ?? 0,
        itemBuilder: (context, index) {
          final product = cart.products![index];
          return ListTile(
            leading: Image.network(product.thumbnail ?? ''),
            title: Text(product.title ?? '', style: TextStyle(fontSize: 19),),
            subtitle: Text('Quantity: ${product.quantity}', style: TextStyle(fontSize: 16),),
            trailing: Text('Price: \$${product.price?.toStringAsFixed(2)}', style: TextStyle(fontSize: 17),)
          );
        },
      ),
    );
  }
}

