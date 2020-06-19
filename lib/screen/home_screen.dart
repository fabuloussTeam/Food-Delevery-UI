import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_start.dart';
import 'restaurant_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget{
   String title = "Food delevier UI";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: new Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 30.0,
              onPressed: (){},
            ),
            backgroundColor: Colors.deepOrangeAccent,
            title: new Text(widget.title),
            centerTitle: true,
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.push(
                   context,
                   MaterialPageRoute(builder: (_) => new CartScreen() ),
                  ),
                   child: new Text(
                    "Card (${currentUser.cart.length})",
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  )
              )
            ],
          ),
          body: new ListView(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(20.0),
                child: new TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 0.8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 0.8, color: Colors.deepOrangeAccent),
                      ),
                      hintText: 'Search food and restaurant',
                      prefixIcon: Icon(Icons.search, size: 30.0),
                      suffixIcon: IconButton(
                        icon: new Icon(Icons.clear),
                        onPressed: (){},
                      )
                  ),
                ),
              ),
              RecentOrders(),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: new Text(
                        "Nearby Restaurant",
                        style: new TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    _buildRestaurants(),
                  ]
              ),
            ],
          )
      ),
    );

  }

  //Construction de la liste des restaurant sur la page d'acceuil

  _buildRestaurants(){

    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;

    List<Widget> restaurantList = [];
    restaurants.forEach((restaurant){
      restaurantList.add(
        new GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant),
              )
          ),
          child: new  Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: new Border.all(
                    width: 1.0,
                    color: Colors.grey[200]
                )
            ),
            child: new Row(
              children: <Widget>[
                new ClipRRect(
                  borderRadius: new BorderRadius.circular(15.0),
                  child: new Hero(
                      tag: restaurant.imageUrl,
                      child: new Image(
                        height: heigth / 5.5,
                        width: width / 3.0 ,
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                  )
                ),
                new Container(
                  margin: EdgeInsets.symmetric(horizontal: width / 25.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        restaurant.name,
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      new RatingStarts(restaurant.rating),
                      new SizedBox(height: 4.0),
                      new Text(
                        restaurant.address,
                        style: new TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      new SizedBox(height: 4.0),
                      new Text(
                        "0.2 miles away",
                        style: new TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      );
    });
    return new Column(children: restaurantList);
  }
}