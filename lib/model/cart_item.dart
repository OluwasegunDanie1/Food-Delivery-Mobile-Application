class CartItem {
  final String name;
  final double price;
  int quantity;
  final String image;
  final String size;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.size,
  });

  double get totalPrice => price * quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      image: json['image'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'size': size,
    };
  }
}
