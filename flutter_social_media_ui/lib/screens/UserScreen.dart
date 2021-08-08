import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/post_carousel.dart';
import 'package:flutter_social_ui/widgets/profile_image_clipper.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  PageController _pageControllerPosts;
  PageController _pageControllerFav;

  @override
  void initState() {
    super.initState();

    _pageControllerPosts = PageController(initialPage: 0, viewportFraction: .80);
    _pageControllerFav = PageController(initialPage: 0, viewportFraction: .80);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileImageClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(currentUser.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Center(
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              currentUser.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      currentUser.following.toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      currentUser.followers.toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            PostCarousel(_pageControllerPosts, 'Your Posts', currentUser.posts),
            PostCarousel(_pageControllerFav, 'Favorites', currentUser.favorites),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
