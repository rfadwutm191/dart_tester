class Produk {
  // 1. definisikan variable yang dibutuhkan
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  // 2. buat konstruktor
  Produk({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });

  // 3. method untuk mengubah JSON menjadi objek Produk
  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: (json["price"] as num).toDouble(),
      category: json["category"],
      image: json["image"],
    );
  }

  // 4. method untuk mengubah objek Produk menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "category": category,
      "image": image,
    };
  }
  
  @override
  String toString() {
    return "Produk(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image)";
  }
}

