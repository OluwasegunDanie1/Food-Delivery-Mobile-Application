class Food {
  final int? id;
  final String category;
  final String name;
  final String image;
  final double price;
  final double rating;
  final List<int>? size;
  final String description;
  final String deliveryTime;
  final String restaurantName;
  final bool? isPopular;
  final bool? isRecommended;

  Food({
    this.id,
    this.size,
    required this.category,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    required this.deliveryTime,
    required this.restaurantName,
    this.isPopular,
    this.isRecommended,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      size: json['size'],
      category: json['category'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      description: json['description'],
      deliveryTime: json['delivery_time'],
      restaurantName: json['restaurant_name'],
      isPopular: json['isPopular'],
      isRecommended: json['isRecommended'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'image': image,
      'size': size,
      'price': price,
      'rating': rating,
      'description': description,
      'delivery_time': deliveryTime,
      'restaurant_name': restaurantName,
      'isPopular': isPopular,
      'isRecommended': isRecommended,
    };
  }
}
