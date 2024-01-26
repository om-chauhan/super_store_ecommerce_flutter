class CartModel {
  int? id;
  int? quantity;
  double? totalPrice;
  String? title;
  double? price;
  String? category;
  String? image;

  CartModel({
    this.id,
    this.quantity,
    this.totalPrice,
    this.title,
    this.price,
    this.category,
    this.image,
  });

  CartModel copyWith({
    int? id,
    int? quantity,
    double? totalPrice,
    String? title,
    double? price,
    String? category,
    String? image,
  }) {
    return CartModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      title: title ?? this.title,
      price: price ?? this.price,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['totalPrice'] = totalPrice;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['image'] = image;
    return data;
  }
}
