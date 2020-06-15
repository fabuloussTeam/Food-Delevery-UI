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
        borderRadius: new BorderRadius.circular(15.0)
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
          color: Colors.blue,
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
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