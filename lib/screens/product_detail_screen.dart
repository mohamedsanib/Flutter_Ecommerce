import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Image.network(product.image, height: 250, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(product.description),
          ),
          Text("₹${product.price}", style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              cart.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to Cart!")));
            },
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
