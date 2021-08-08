import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/near_by_restaurant_item.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';
import '../data/data.dart';
import '../widgets/search_bar_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        leading: IconButton(
          icon: IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
            onPressed: () {},
          ),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CartScreen())),
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          HomeSearchBar(),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Restaurants',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              _buildRestaurants(),
            ],
          ),
        ],
      ),
    );
  }
}

_buildRestaurants() {
  List<Widget> _restaurantList = [];
  restaurants.forEach((res) {
    _restaurantList.add(NearByRestaurants(res));
  });
  return Column(
    children: [
      ..._restaurantList,
    ],
  );
}
