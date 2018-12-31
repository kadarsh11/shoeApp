import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool watchLater = false;
  String image =
      "https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/of8symy3urnrrgatrxgq/free-rn-motion-flyknit-2018-running-shoe-F4k2ng.jpg";
  String productName = "LeBron 16";
  String productPrice = "185.0";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      splashColor: Colors.white,
      child: Card(
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Nike',
                    style: TextStyle(color: Colors.grey, fontSize: 13.0),
                  ),
                  InkWell(
                    child: watchLater == false
                        ? Icon(
                            Icons.favorite_border,
                            size: 18.0,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18.0,
                          ),
                    onTap: () {
                      setState(() {
                        watchLater = !watchLater;
                      });
                    },
                  )
                ],
              ),
              Expanded(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                productName,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.2,
                ),
                maxLines: 1,
              ),
              Text(
                productPrice,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
