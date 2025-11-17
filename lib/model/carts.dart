class Cart {
  int id;
  int userId;
  String date;
  List<CartProduct> products;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      products: (json['products'] as List)
          .map((p) => CartProduct.fromJson(p))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'date': date,
      'products': products.map((p) => p.toJson()).toList(),
    };
  }
}

class CartProduct {
  int productId;
  int quantity;

  CartProduct({required this.productId, required this.quantity});

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
