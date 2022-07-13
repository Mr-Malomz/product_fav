class AppConstant {
  final String databaseId = "62ce9dca2b233ee17e19";
  final String projectId = "62ce9dbb875014ac9710";
  final String endpoint = "http://192.168.1.14/v1";
  final String collectionId = "62cea073e6496bdaf954";
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

  Map<dynamic, dynamic> toJson() {
    return {'title': title, 'description': description, 'isFav': isFav};
  }
}