import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget{

  _buildRecentOrder(BuildContext context, order){
    return new Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[200])
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: <Widget>[
                new ClipRRect(
                  borderRadius: new BorderRadius.circular(15.0),
                  child: new Image(
                    width: 100.0,
                    height: 100.0,
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.all(12.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.food.name,
                          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        new SizedBox(height: 4.0),
                        Text(
                          order.restaurant.name,
                          style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        new SizedBox(height: 4.0),
                        Text(
                          order.date,
                          style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: new BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: new BorderRadius.circular(30.0)
            ),
            child: new IconButton(
              icon: new Icon(Icons.add),
              color: Colors.white,
              iconSize: 30.0,
              onPressed: (){},
            ),

          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: new Text(
            "Recent Orders",
            style: new TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2
            ),
          ),
        ),
        new Container(
          height: 120.0,
          // color: Colors.blue,
          child: new ListView.builder(
              physics: new BouncingScrollPhysics(), // pour tirrer l'image en fin ligne
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal, // Organise les elements de la listeView de facon horizontal
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index){
                Order order = currentUser.orders[index];
                return _buildRecentOrder(context, order);
              }
          ),
        )
      ],
    );
  }
}