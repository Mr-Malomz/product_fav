import 'package:flutter/material.dart';
import 'package:product_fav/product_service.dart';
import 'package:product_fav/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product>? products;
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    _getProductList();
    super.initState();
  }

  _getProductList() {
    setState(() {
      _isLoading = true;
    });
    ProductService().getAllProducts().then((value) {
      setState(() {
        products = value;
        _isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    });
  }

  _addAsFavourite(
      String title, String description, String id, bool isFav, int index) {
    ProductService().addAsFav(title, description, id, isFav).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('favourites updated successfully!')),
      );
      setState(() {
        products![index].isFav = isFav;
      });
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error adding favourite!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.blue,
          ))
        : _isError
            ? const Center(
                child: Text(
                  'Error loading products',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: products?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var isFav =
                          products![index].isFav == false ? true : false;
                      _addAsFavourite(
                        products![index].title,
                        products![index].description,
                        products![index].$id!,
                        isFav,
                        index,
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: .5, color: Colors.grey),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products![index].title,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 10.0),
                                Text(products![index].description)
                              ],
                            ),
                          ),
                          Icon(
                            products![index].isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: products![index].isFav
                                ? Colors.red
                                : Colors.grey,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
  }
}
