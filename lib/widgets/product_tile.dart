import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.network(product.image, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("₹${product.price}"),
            ),
          ],
        ),
      ),
    );
  }
}
