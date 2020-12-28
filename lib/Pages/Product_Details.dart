import 'package:flutter/material.dart';
import 'package:flutter_ecomm/main.dart';
import 'package:flutter_ecomm/Pages/home.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;
  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: InkWell(
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
            child: new Text('Fashapp')),
        actions: <Widget>[
        new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),

      ],
    ),
      body: new ListView(
        children: <Widget>[
          new Container(
          height: 300.0,
          child: GridTile(
            child: Container(
              color: Colors.white,
              child: Image.asset(widget.product_detail_picture),
              ),
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                  leading: new Text(widget.product_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                  title: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Text("${widget.product_detail_old_price} Rs",
                      style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough))
                        ),
                        Expanded(
                            child: new Text("${widget.product_detail_new_price} Rs",
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
                        ),
                      ]
                  )
              )
            ),
            ),
          ),
// ====================== the first buttons======================
          Row(
            children: <Widget>[
              // ====================== the size button======================
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                  return new AlertDialog(
                    title: new Text("Size"),
                    content: new Text("Choose the size"),
                    actions: <Widget>[
                      new MaterialButton(onPressed: (){
                        Navigator.of(context).pop(context);
                      },
                          child: new Text("Close"),
                      )
                    ],
                  );
                    });
              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Size")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
              ),
              ),
              // ====================== the Color button======================
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Color"),
                        content: new Text("Choose the Color"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("Close"),
                          )
                        ],
                      );
                    });
              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Color")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
              ),
              ),
              // ====================== the Qty button======================
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Choose the quantity"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("Close"),
                          )
                        ],
                      );
                    });
              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Qty")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
              ),
              ),
            ],
          ),
// ====================== the second buttons======================
          Row(
            children: <Widget>[
              // ====================== the size button======================
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Buy Now")
              ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red, onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border), color: Colors.red,onPressed: (){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            subtitle: new Text("Contrary to popular belief, Lorem Ipsum is not simply random text. "
                "It has roots in a piece of classical Latin literature from 45 BC, "
                "making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, "
                "looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, "
                "and going through the cites of the word in classical literature, discovered the undoubtable source.",
                style: TextStyle(color: Colors.black54, fontSize: 15.0)),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product Name:",
                  style: TextStyle(color: Colors.grey, fontSize: 18.0)),
                  ),
              Padding(padding: const EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Brand:",
                    style: TextStyle(color: Colors.grey, fontSize: 18.0)),
              ),
              //REMEMBER TO CREATE THE PRODUCT BRAND
              Padding(padding: const EdgeInsets.all(5.0),
                child: new Text("Brand XXX"),),
            ],
          ),

          //ADD THE PRODUCT CONDITION
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Condition:",
                    style: TextStyle(color: Colors.grey, fontSize: 18.0)),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
                child: new Text("New"),)
            ],
          ),
          //SIMILAR PRODUCTS SECTION
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding:  const EdgeInsets.all(8.0),
                child: new Text("Similar Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
            ],
          ),

          Container(
            height: 340.0,
            child: Similar_Products(),
          )

      ],
    ),
    );
  }
}

class Similar_Products extends StatefulWidget {
  @override
  _Similar_ProductsState createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
  var produt_list = [
    {
      "name": "Men Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 5000,
      "price": 3999,
    },
    {
      "name": "Women Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 5000,
      "price": 3999,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 8500,
      "price": 5000,
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 8500,
      "price": 5000,
    },


  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: produt_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Similar_Single_Product(product_name: produt_list[index]['name'],
            prod_picture: produt_list[index]['picture'],
            prod_old_price: produt_list[index]['old_price'],
            prod_price: produt_list[index]['price'],
          );
        });
  }
}
class Similar_Single_Product extends StatelessWidget {
  final product_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Similar_Single_Product({
    this.product_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price
  });
  @override
  Widget build(BuildContext context) {
    return Card(


      child: Material(
        child: InkWell(
          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
            //here we are passing the values of the product to the product details page
              builder: (context)=> new ProductDetails(
                  product_detail_name: product_name,
                  product_detail_new_price: prod_price,
                  product_detail_old_price: prod_old_price,
                  product_detail_picture: prod_picture))),
          child: GridTile(
              footer: Container(
                color: Colors.white,
                child: new Row(
                  children: [
                    Expanded(
                      child: new Text(product_name,
                        style: TextStyle( fontWeight: FontWeight.bold,fontSize: 16.0),),),
                    new Text("$prod_price Rs",
                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,),)
                  ],
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
