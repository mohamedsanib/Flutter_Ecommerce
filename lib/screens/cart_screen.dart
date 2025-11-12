import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: ListView.builder(
        itemCount: cart.cart.length,
        itemBuilder: (_, i) {
          final item = cart.cart[i];
          return ListTile(
            leading: Image.network(item.image, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text("₹${item.price}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () => cart.removeFromCart(item),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.deepPurple,
        padding: const EdgeInsets.all(16),
        child: Text(
          "Total: ₹${cart.totalPrice.toStringAsFixed(2)}",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
