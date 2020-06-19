import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_start.dart';

class RestaurantScreen extends StatefulWidget{

  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}


class _RestaurantScreenState extends State<RestaurantScreen>{

  _buildMenuItem(Food menuItem, double height, double width){
    return new Center(
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
         new Container(
           width:  width / 2.5,
           height: width / 2.5,
           decoration: new BoxDecoration(
             image: DecorationImage(
               image: AssetImage(menuItem.imageUrl),
               fit: BoxFit.cover,
             ),
             borderRadius: new BorderRadius.circular(15.0)
           ),
          ),
          new Container(
            width:  width / 2.5,
            height: width / 2.5,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(15.0),
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ],
                stops: [0.1, 0.4, 0.6, 0.9]
              ),
            ),
          ),
          new Positioned(
            bottom: 65.0,
            child: new Column(
              children: <Widget>[
                new Text(
                  menuItem.name,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                  ),
                ),
                new Text(
                  "\$${menuItem.price.toString()}",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                  ),
                )
              ],
            ),
          ),
          new Positioned(
            bottom: 10.0,
            right: 5.0,
            child: new Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 48.00,
            decoration: new BoxDecoration(
               borderRadius: new BorderRadius.circular(30.0),
               color: Colors.deepOrangeAccent
            ),
              child:  new IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: () => Navigator.pop(context)
              ),
              ),
          ),
        ],
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Hero(
                  tag: widget.restaurant.imageUrl,
                  child: new Image(
                    image: AssetImage(widget.restaurant.imageUrl),
                    height: heigth / 3.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: heigth / 14),
                  child: new  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 30.0,
                          onPressed: () => Navigator.pop(context)
                      ),
                      new IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.deepOrangeAccent,
                        iconSize: 35.0,
                        onPressed: () => {},
                      )
                    ],
                  ),
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(20.0),
              child: new  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        widget.restaurant.name,
                        style: new TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      new Text(
                        "0.2 miles away",
                        style: new TextStyle(
                            fontSize: 18.0
                        ),
                      ),
                    ],
                  ),
                  new RatingStarts(widget.restaurant.rating),
                  new SizedBox(height: 6.0,),
                  new Text(widget.restaurant.address),
                  new SizedBox(height: 12.0,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FlatButton(
                        onPressed: (){},
                        color: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        ),
                        child: new Text(
                          "Reviews",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                      ),
                      new FlatButton(
                        onPressed: (){},
                        color: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        ),
                        child: new Text(
                          "Contact",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                      )
                    ],
                  ),
                  new SizedBox(height: 10.0),
                  new Center(
                    child: new Text(
                      "Menu",
                      style: new TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2
                      ),
                    ),
                  ),
                  new SizedBox(height: 10.0),
                  new Container(
                   height: heigth / 2,
                  /*  decoration: new BoxDecoration(
                        color: Colors.red
                    ),*/
                    child: new GridView.count(
                      padding: EdgeInsets.all(10.0),
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: List.generate(widget.restaurant.menu.length, (i) {
                        Food food = widget.restaurant.menu[i];
                        print(food.name);
                        return new Card(
                          child: _buildMenuItem(food, heigth, width)
                        );
                      }),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

