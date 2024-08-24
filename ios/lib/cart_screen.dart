import 'package:finalproject/Constants/textconstant.dart';
import 'package:finalproject/provider/api_provider.dart';
import 'package:finalproject/provider/models/cart_model.dart';
import 'package:finalproject/screens/cartproduct_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Carts? _carts;

  @override
  void initState() {
    super.initState();
    getCarts().then((data) {
      print(data);

      setState(() {
        _carts = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TEXT(
                name: 'Carts',
              ),
            ),
            _carts == null
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                      itemCount: _carts!.carts?.length ?? 0,
                      itemBuilder: (context, index) {
                        final cart = _carts!.carts![index];
                        return ListTile(
                          title: Text(
                            'Cart ID: ${cart.id}',
                            style: TextStyle(fontSize: 23),
                          ),
                          subtitle: Text(
                            'Total: \$${cart.total} ',
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CartproductScreen(cart: cart),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    ));
  }
}
