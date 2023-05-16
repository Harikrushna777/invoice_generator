class product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final int price;

  product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
  });

  factory product.fromMap({required Map data}) {
    return product(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
      price: data['price'],
    );
  }
}
