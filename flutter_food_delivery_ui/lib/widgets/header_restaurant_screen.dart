import 'package:flutter/material.dart';

class HeaderRestaurantScreen extends StatelessWidget {
  final restaurant;

  HeaderRestaurantScreen(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: restaurant.imageUrl,
          child: Image(
            height: 220,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            image: AssetImage(restaurant.imageUrl),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).primaryColor,
                  size: 35,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
