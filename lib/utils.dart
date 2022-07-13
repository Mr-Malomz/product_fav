class AppConstant {
  final String projectId = "6282b18069da02a92d06";
  final String endpoint = "http://192.168.1.7/v1";
  final String collectionId = "6282b1c4a392b2dcbf3b";
}

class Product {
  String? $id;
  String title;
  String description;
  bool isFav;

  Product({
    this.$id,
    required this.title,
    required this.description,
    required this.isFav,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
      $id: json['\$id'],
      title: json['title'],
      description: json['description'],
      isFav: json['isFav'],
    );
  }
}
