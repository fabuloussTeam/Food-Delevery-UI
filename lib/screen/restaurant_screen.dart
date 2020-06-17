import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_start.dart';

class RestaurantScreen extends StatefulWidget{

  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}


class _RestaurantScreenState extends State<RestaurantScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Hero(
                tag: widget.restaurant.imageUrl,
                child: new Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
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

                ],
              ),

          ),
        ],
      )
    );
  }
}

