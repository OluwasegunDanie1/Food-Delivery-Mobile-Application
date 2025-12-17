class Restaurant {
  final int? id;
  final String name;
  final String image;
  final double rating;
  final String desc;
  final String deliveryTime;
  final String price;
  final String category;

  Restaurant({
    this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.desc,

    required this.deliveryTime,
    required this.price,
    required this.category,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      desc: json['desc'],
      deliveryTime: json['delivery_time'],
      price: json['price'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'desc': desc,
      'delivery_time': deliveryTime,
      'price': price,
      'category': category,
    };
  }
}
