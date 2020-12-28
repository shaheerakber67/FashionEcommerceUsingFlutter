import 'package:flutter/material.dart';
import 'package:flutter_ecomm/Pages/Product_Details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 4500,
      "price": 3000,
    },
    {
      "name": "Heels",
      "picture": "images/products/hills2.jpeg",
      "old_price": 4500,
      "price": 3000,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 2500,
      "price": 1000,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 3500,
      "price": 2500,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 3500,
      "price": 2500,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 3500,
      "price": 2500,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: produt_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(product_name: produt_list[index]['name'],
            prod_picture: produt_list[index]['picture'],
            prod_old_price: produt_list[index]['old_price'],
            prod_price: produt_list[index]['price'],
            ),
          );
        });
  }
}
class Single_prod extends StatelessWidget {
  final product_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Single_prod({
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

