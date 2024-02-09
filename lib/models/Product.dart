class Product {
  final String id;
  final String user;
  final String name;
  final String image;
  final String brand;
  final String category;
  final String description;
  final double rating;
  final int numReviews;
  final double price;
  final int countInStock;
  final List<dynamic> reviews;
  final String createdAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.user,
    required this.name,
    required this.image,
    required this.brand,
    required this.category,
    required this.description,
    required this.rating,
    required this.numReviews,
    required this.price,
    required this.countInStock,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      user: json['user'],
      name: json['name'],
      image: json['image'],
      brand: json['brand'],
      category: json['category'],
      description: json['description'],
      rating: json['rating'].toDouble(),
      numReviews: json['numReviews'],
      price: json['price'].toDouble(),
      countInStock: json['countInStock'],
      reviews: json['reviews'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
