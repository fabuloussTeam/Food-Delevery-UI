import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget{
   String title = "Food delevier UI";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
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
                onPressed: (){},
                child: new Text(
                  "Card (${currentUser.cart.length})",
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                )
            )
          ],
        ),
        body: new ListView(
          children: <Widget>[
            Padding(
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
            RecentOrders()
          ],
        )
         
    );
  }
}