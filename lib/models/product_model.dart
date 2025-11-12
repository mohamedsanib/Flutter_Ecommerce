class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      name: data['name'],
      description: data['description'],
      price: (data['price'] ?? 0).toDouble(),
      image: data['image'],
    );
  }
}
