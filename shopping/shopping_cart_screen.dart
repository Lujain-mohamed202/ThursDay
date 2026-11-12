import 'package:basic_statefull/shopping/cart_item.dart';
import 'package:basic_statefull/shopping/shopping_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<ShoppingProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text("Cart"),
      ),
      body: Consumer<ShoppingProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: provider.cart.length,
            itemBuilder: (context, index) {
              return CartItem(product: provider.cart[index]);
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<ShoppingProvider>(
        builder: (context, value, child) {
          return Container(
            height: 50,
            color: Colors.teal,
            child: Center(
              child: Text(
                "Total Amount : \$${provider.calculateTotal().toStringAsFixed(0)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
