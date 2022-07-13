import 'package:appwrite/appwrite.dart';
import 'package:product_fav/utils.dart';

class ProductService {
  Client client = Client();
  Databases? db;

  NoteService() {
    _init();
  }

  //initialize the application
  _init() async {
    client
        .setEndpoint(AppConstant().endpoint)
        .setProject(AppConstant().projectId);

    db = Databases(client, databaseId: '');
  }

  Future<List<Product>> getAllProducts() async {
    try {
      var data =
          await db?.listDocuments(collectionId: AppConstant().collectionId);
      var productList = data?.documents
          .map((product) => Product.fromJson(product.data))
          .toList();
      return productList!;
    } catch (e) {
      throw Exception('Error getting list of products');
    }
  }

  Future<List<Product>> getAllFavourites() async {
    try {
      var data = await db?.listDocuments(
          collectionId: AppConstant().collectionId,
          queries: [Query.equal('isFav', true)]);
      var favList =
          data?.documents.map((fav) => Product.fromJson(fav.data)).toList();
      return favList!;
    } catch (e) {
      throw Exception('Error getting list of favourites');
    }
  }
}
