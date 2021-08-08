import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/folllowing_users.dart';
import 'package:flutter_social_ui/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: .8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title:  Text(
            'FRENZY',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              letterSpacing: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        bottom: TabBar(
          controller: _controller,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          indicatorWeight: 3.0,
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          tabs: [
            Tab(
              text: 'Trending',
            ),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      body: ListView(
        children: [
          FollowingUers(),
          PostCarousel(_pageController, 'Posts', posts),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
