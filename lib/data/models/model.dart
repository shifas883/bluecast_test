class Product {
  final String image;
  final String title;
  final String description;
  final double price;

  Product({required this.image, required this.title, required this.description, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'],
      title: json['title'],
      description: json['description'],
      price: json['price']?.toDouble()??0.0,
    );
  }
}