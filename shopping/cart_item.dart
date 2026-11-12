import 'package:basic_statefull/shopping/product_model.dart';
import 'package:basic_statefull/shopping/shopping_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  new({super.key, required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<ShoppingProvider>(
        builder: (context, value, child) {
          return ListTile(
            leading: Icon(product.productIcon),
            title: Text(product.name),
            subtitle: Text("\$${product.price}"),
            trailing: Row(
              mainAxisSize: .min,
              children: [
                IconButton(
                  onPressed: () {
                    value.removeFromCart(product);
                  },
                  icon: Icon(Icons.remove),
                ),
                Text("${product.countity}"),
                IconButton(
                  onPressed: () {
                    value.addToCart(product);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
