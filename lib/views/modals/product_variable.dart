class product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final int price;
  final String brand;
  final String category;
  int quantuty = 1;

  product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.brand,
    required this.category,
    // required this.discountPercentage,
    // required this.stock,
  });

  factory product.fromMap({required Map data}) {
    return product(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
      price: data['price'],
      brand: data['brand'],
      category: data['category'],
      // discountPercentage: data['discountPercentage'],
      // stock: data['stock'],
    );
  }
}
