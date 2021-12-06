import 'package:animate_do/animate_do.dart';
import 'package:flutter/rendering.dart';
import 'package:sanket/theme/color.dart';
import 'package:sanket/model/productslider.dart';
import 'package:flutter/material.dart';
import 'package:sanket/app_screen/utils.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String Des;
  final List<String> MulImage;
  const ProductDetailPage({
    Key? key,
    required this.MulImage,
    required this.name,
    required this.img,
    required this.price,
    required this.Des,
  }) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: black.withOpacity(0.1),
                spreadRadius: 1,
              )
            ], borderRadius: BorderRadius.circular(30), color: grey),
            child: Stack(
              children: <Widget>[
                FadeInDownBig(
                  child: ProductSlider(
                    items: widget.MulImage,
                  ),
                ),
                SafeArea(
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
          ),
          FadeInDownBig(
            delay: Duration(milliseconds: 350),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w600, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FadeInDownBig(
              delay: Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "\$ " + widget.price,
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w500, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FadeInDownBig(
                    delay: Duration(milliseconds: 450),
                    child: Text(
                      "Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FadeInDownBig(
                    delay: Duration(milliseconds: 450),
                    child: Text(
                      widget.Des,
                      style: TextStyle(
                          fontSize: 15, color: black.withOpacity(0.7)),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 20,
          ),
          FadeInDownBig(
            delay: Duration(milliseconds: 550),
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 1,
                              color: black.withOpacity(0.1))
                        ],
                        color: grey),
                    child: Center(
                      child: Icon(Icons.add_shopping_cart),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: black,
                      onPressed: () {},
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                                color: white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
