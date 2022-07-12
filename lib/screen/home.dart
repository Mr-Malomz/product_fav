import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print(index);
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
                        'Product Title $index',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 10.0),
                      Text('Detailed product description $index')
                    ],
                  ),
                ),
                Icon(Icons.favorite_border)
              ],
            ),
          ),
        );
      },
    );
  }
}
