import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
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
                      'Product Title $index',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10.0),
                    Text('Detailed product description $index')
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
