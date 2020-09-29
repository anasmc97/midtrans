import 'package:flutter/material.dart';
import 'package:midtrans/Item.dart';
import './ProductPage.dart';
import './Product.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage());
  }}


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Feed'),
      Text('Keranjang'),
      Text('Akun'),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue,
          title:
              Text('KiosTR', textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Icons.favorite),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Icons.alarm),
            )
          ],
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                title: Text(
                  'Feed',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart),
                title: Text(
                  'Keranjang',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.mood),
                title: Text(
                  'Akun',
                ))
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xff597de9),
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context) {

  // will pick it up from here
  // am to start another template
  List<Product> computers = [
    Product(
        name: "ASUS Laptop E402WA",
        image: "assets/gambar.png",
        price: 10000,
        userLiked: true,
        discount: 30),
    Product(
        name: "MacBook Pro",
        image: "assets/gambar.png",
        price: 20000,
        userLiked: false,
        discount: 20),
    Product(
      name: "Acer Aspire E5575",
      image: 'assets/gambar.png',
      price: 7000,
      userLiked: false,
    ),
    Product(
        name: "Alienware",
        image: "assets/gambar.png",
        price: 20000,
        userLiked: true,
        discount: 10)
  ];

  List<Product> handphones = [
    Product(
        name: "SAMSUNG Galaxy A30",
        image: "assets/gambar.png",
        price: 10000,
        userLiked: true,
        discount: 5),
    Product(
        name: "Hp Oppo A39",
        image: "assets/gambar.png",
        price: 3000,
        userLiked: false,
        discount: 30),
    Product(
        name: "Iphone 11 Pro",
        image: "assets/gambar.png",
        price: 20000,
        userLiked: false),
    Product(
        name: "Vivo Y91C",
        image: "assets/gambar.png",
        price: 5000,
        userLiked: true,
        discount: 20)
  ];

  return ListView(children: <Widget>[
    deals('Komputer', onViewMore: () {}, items: <Widget>[
      productItem(computers[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: computers[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      productItem(computers[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: computers[1],
              );
            },
          ),
        );
      }, imgWidth: 250, onLike: () {
        
      }),
      productItem(computers[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: computers[2],
              );
            },
          ),
        );
      }, imgWidth: 200, onLike: () {
       
      }),
      productItem(computers[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: computers[3],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
    ]),
    deals('Handphone', onViewMore: () {}, items: <Widget>[
      productItem(handphones[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: handphones[0],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      productItem(handphones[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: handphones[1],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 75),
      productItem(handphones[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: handphones[2],
              );
            },
          ),
        );
      }, imgWidth: 110, onLike: () {}),
      productItem(handphones[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: handphones[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ])
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('Lihat Semua ›'),
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: Colors.white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›')
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Tidak ada item tersedia',
                          ),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}