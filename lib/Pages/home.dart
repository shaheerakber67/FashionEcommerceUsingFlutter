import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//import pages
import 'package:flutter_ecomm/Components/HorizontalListView.dart';
import 'package:flutter_ecomm/Components/products.dart';
import 'package:flutter_ecomm/Pages/cart.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    Widget image_carousel = new Container(
        height: 250.0,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/w3.jpeg'),
            AssetImage('images/m1.jpeg'),
            AssetImage('images/c1.jpg'),
            AssetImage('images/w4.jpeg'),
            AssetImage('images/m2.jpg'),
          ],
          autoplay: false,
          noRadiusForIndicator: true,
          dotSpacing: 25,
          dotSize: 4.4,
          dotBgColor: Colors.white.withOpacity(0.0),
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
        )
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: new Text('Fashapp'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
          })
        ],
      ),
      drawer: new Drawer(child: new ListView(
        children: <Widget>[
          //header
          new UserAccountsDrawerHeader(
            accountName: Text('Shaheer Akber'),
            accountEmail: Text('shaheerakber67@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.red,
            ) ,
          ),
          //body
          InkWell(
            onTap:(){},
            child: ListTile(
              title: new Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.red),
            ),
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
              title: new Text('My Account'),
              leading: Icon(Icons.person, color: Colors.red),
            ),
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
              title: new Text('My Orders'),
              leading: Icon(Icons.shopping_basket, color: Colors.red),
            ),
          ),
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));},
            child: ListTile(
              title: new Text('Shopping Cart'),
              leading: Icon(Icons.shopping_cart, color: Colors.red),
            ),
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
              title: new Text('Favourites'),
              leading: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
          Divider(),
          InkWell(
            onTap:(){},
            child: ListTile(
              title: new Text('Settings'),
              leading: Icon(Icons.settings,color: Colors.blue),
            ),
          ),
          InkWell(
            onTap:(){},
            child: ListTile(
              title: new Text('About'),
              leading: Icon(Icons.help, color: Colors.green,),
            ),
          ),
        ],
      ),
      ),
      body: new Column(
        children: <Widget> [
          //Image Carousel
          image_carousel,
          //padding widget
          new Padding(padding: const EdgeInsets.all(7.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Categories',
                  style: TextStyle(fontSize: 23)),
            ),
          ),
          //Horizontal List View Begins here
          HorizontalList(),
          //padding widget
          new Padding(padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Recent Products',
                  style: TextStyle(fontSize: 23)),
            ),

          ),
          //grid view
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}


