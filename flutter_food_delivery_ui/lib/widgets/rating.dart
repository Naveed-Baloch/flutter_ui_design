import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final rating;

  RatingBar(this.rating);

  List<Widget> _rating = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < rating; i++) {
      _rating.add(
        Icon(
          Icons.star,
          color: Colors.amberAccent,
        ),
      );
    }
    return Container(
      child: Row(
        children: [..._rating],
      ),
    );
  }
}
