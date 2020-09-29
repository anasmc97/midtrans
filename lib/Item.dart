import 'package:flutter/material.dart';
import './Product.dart';


Widget productItem(Product product,
    {double imgWidth, onLike, onTapped, bool isProductPage = false}) {

  return Container(
    width: 180,
    height: 200,
    margin: EdgeInsets.only(left: 20, bottom: 30),
    child: Stack(
      children: <Widget>[
        Container(
            width: 180,
            height: 300,
            child: RaisedButton(
                color: Colors.white,
                elevation: (isProductPage) ? 20 : 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: product.name,
                    child: Image.asset(product.image,
                        width: (imgWidth != null) ? imgWidth : 100)))),
        Positioned(
          bottom: 10,
          left: 10,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.name,),
                    Text("Rp "+product.price.toString(),),
                  ],
                )
              : Text(' '),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: (product.discount != null)
                ? Container(
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(product.discount.toString() + '%',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                  )
                : SizedBox(width: 0))
      ],
    ),
  );
}