import 'package:flutter/material.dart';

class RatingStarts extends StatelessWidget {

  final int rating;

  RatingStarts(this.rating);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

   String star = "";
     for(int i = 0; i < rating; i++) {
          star += "⭐ "; // utilisation des emojies
     }
     star.trim();
    return new Text(star, style: new TextStyle(color: Colors.yellow),);
  }
}