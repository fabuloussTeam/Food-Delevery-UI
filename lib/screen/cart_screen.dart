import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  _buildCartItem(Order order){
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: new Row(
        children: <Widget>[
          new Expanded(
              child:  new Row(
                children: <Widget>[
                  new Container(
                    width: 150.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(order.food.imageUrl),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                  ),
                  new Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                order.food.name,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              new SizedBox(height: 10.0,),
                              new Text(
                                order.restaurant.name,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              new SizedBox(height: 10.0,),
                              new Container(
                                width: 100,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      width: 0.8,
                                      color: Colors.black54
                                  ),
                                ),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new GestureDetector(
                                      onTap: (){print("vous appuyer sur --");},
                                      child: new Text(
                                        '-',
                                        style: new TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0
                                        ),
                                      ),
                                    ),
                                    new SizedBox(width: 20.0,),
                                    new Text(
                                      order.quantity.toString(),
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    new SizedBox(width: 20.0,),
                                    new GestureDetector(
                                      onTap: (){print("vous appuyer sur +++");},
                                      child: new Text(
                                        '+',
                                        style: new TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                      )
                  ),
                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Text(
                      "\$${order.quantity * order.food.price}",
                      style: new TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double totalPrice = 0.0;
    currentUser.cart.forEach((Order order) => totalPrice += order.quantity * order.food.price);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: new Text("Card (${currentUser.cart.length})",),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: currentUser.cart.length,
                  itemBuilder: (BuildContext context, int index){
                    //  if(index < currentUser.cart.length + 1) {
                    Order order = currentUser.cart[index];
                    return _buildCartItem(order);
                    //  }
                  },
                  separatorBuilder: (BuildContext context, int index){
                    return Divider(
                      height: 1.0,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              new Container(
                height: 300.0,
                padding: EdgeInsets.all(15.0),
                // margin: EdgeInsets.all(0.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Estimated Delivery Time",
                          style: new TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0
                          ),
                        ),
                        new Text(
                          "25 min",
                          style: new TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Total Coast",
                          style: new TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0
                          ),
                        ),
                        new Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: new TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 80.0,),

            ],
          ),
        ),


        bottomSheet: new Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -1),
                    blurRadius: 6.0,
                  )
                ]
            ),
            child: new Center(
              child: new FlatButton(
                  onPressed: (){},
                  child: new Text(
                    "CHECKOUT",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0

                    ),
                  )
              ),
            )
        )
    );
  }
}