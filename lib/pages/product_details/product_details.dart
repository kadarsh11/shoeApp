import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetails extends StatefulWidget {
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = '9';
  int mainImage = 0;

  List<String> sizes = ['7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11'];

  List<String> images = [
    'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/x5pj9xd4lqnsopsypjt6/free-rn-motion-flyknit-2018-running-shoe-F4k2ng.jpg',
    'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/bl6whmahcuxi3juhinfl/free-rn-motion-flyknit-2018-running-shoe-F4k2ng.jpg',
    'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/exdbqpciukq0fhn50xpk/free-rn-motion-flyknit-2018-running-shoe-F4k2ng.jpg'
  ];

  double rating = 4.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(children: [
          ListView(
            children: <Widget>[
              Container(
                height: height / 2.5,
                child: Image.network(
                  images[mainImage],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 5.0,
              ),
              multipleImageRow(),
              Container(
                height: 5.0,
              ),
              productDiscription(),
              Container(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text("Size in US"),
              ),
              sizeSelectView(width),
              addToBag()
            ],
          ),
        ]),
      ),
    );
  }

  Widget addToBag() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: FlatButton(
          splashColor: Colors.red[300],
          textColor: Colors.white,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.card_travel,
                  color: Colors.white,
                ),
                Container(
                  width: 8.0,
                ),
                Text(
                  "Add to Bag",
                )
              ],
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget productDiscription() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Nike Hyperdunk x Low (Team)",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2,
                        wordSpacing: 3.0),
                  ),
                  Container(
                    height: 3.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SmoothStarRating(
                        allowHalfRating: false,
                        onRatingChanged: (v) {
                          rating = v;
                          setState(() {});
                        },
                        starCount: 5,
                        rating: rating,
                        size: 20.0,
                        color: Colors.yellow,
                        borderColor: Colors.yellow,
                      ),
                      Text(
                        "13 Reviews",
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      Container(
                        width: 3.0,
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "120",
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              Text(
                "101.97",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget multipleImageRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [0, 1, 2]
            .map((index) => mainImage == index
                ? InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black38, width: 2.0)),
                      width: 90.0,
                      height: 90.0,
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        mainImage = index;
                      });
                    },
                  )
                : InkWell(
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      child: Image.network(images[index]),
                    ),
                    onTap: () {
                      setState(() {
                        mainImage = index;
                      });
                    },
                  ))
            .toList());
  }

  Widget sizeSelectView(double width) {
    return Container(
        height: 50.0,
        child: ListView(
          semanticChildCount: 4,
          scrollDirection: Axis.horizontal,
          children: sizes
              .map((result) => result == selectedSize
                  ? InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Container(
                          width: width / 8,
                          height: 25.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                            child: Text(
                              result,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSize = result;
                        });
                      },
                    )
                  : InkWell(
                      child: Container(
                        width: width / 8,
                        height: 30.0,
                        child: Center(
                          child: Text(
                            result,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSize = result;
                        });
                      },
                    ))
              .toList(),
        ));
  }
}
