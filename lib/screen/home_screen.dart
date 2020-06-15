 import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

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
    );
  }
}