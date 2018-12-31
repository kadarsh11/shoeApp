import 'package:flutter/material.dart';
import '../components/product.dart';

class Test extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: [1, 2, 3, 4, 5, 6]
            .map((result) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Product(),
                ))
            .toList(),
      ),
    );
  }
}
