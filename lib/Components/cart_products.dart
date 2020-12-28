
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_carts = [
    {
    "name": "Skirt",
    "picture": "images/products/skt2.jpeg",
    "price": 2500,
    "size": "S",
    "color": "Red",
    "quantity": 1,
  },
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 3999,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 3999,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_carts.length,
        itemBuilder: (context, index){
        return Single_cart_product(
          cart_prod_name: Products_on_the_carts[index]['name'],
          cart_prod_picture: Products_on_the_carts[index]['picture'],
          cart_prod_price: Products_on_the_carts[index]['price'],
          cart_prod_size: Products_on_the_carts[index]['size'],
          cart_prod_color: Products_on_the_carts[index]['color'],
          cart_prod_qty: Products_on_the_carts[index]['quantity'],
        );
        });

  }
}
class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_size;
  final cart_prod_price;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_size,
    this.cart_prod_price,
    this.cart_prod_color,
    this.cart_prod_qty
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
       // =============LEADING SECTION========================
        leading: new Image.asset(cart_prod_picture, width: 80.0,height: 80.0,),
        // =============TITLE SECTION========================
        title: new Text(cart_prod_name),
        // =============SUBTITLE SECTION========================
        subtitle: new Column(
          children: [
            //Row Inside The Column
            new Row(
              children: [
                //===================== this section is for the size of the product=====================
                Padding(padding: const EdgeInsets.all(8.0),
                   child: new Text("Size:"),
                ),
                Padding(padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size, style: TextStyle(color: Colors.red),),
                ),
                //===================== this section is for the Color of the product=====================
                new Padding(padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                child: new Text("Color:"),
                ),
                Padding(padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_color,
                    style: TextStyle(color: Colors.red)),
                ),


              ],
            ),
            //===================== this section is for the Price of the product=====================
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("$cart_prod_price Rs",
                style: TextStyle(
                    fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.red
                ),),

            ),
          ],
        ),
        trailing:
        FittedBox(
          fit: BoxFit.fill,
          child:
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up,color: Colors.red),iconSize: 38, onPressed: () {}),
              Text('$cart_prod_qty',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.red,),iconSize: 38, onPressed: () {}),

            ],
          ),
        ),
      ),
    );
  }
}

