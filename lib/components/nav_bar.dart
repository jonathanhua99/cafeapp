import 'package:flutter/material.dart';
import 'package:cafe_app/screens/home_screen.dart';
import 'package:cafe_app/screens/search_screen.dart';
import 'package:cafe_app/screens/collections_screen.dart';
import 'package:cafe_app/screens/forum_screen.dart';
import 'package:cafe_app/screens/profile_screen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, SearchScreen.id),
                child: Icon(Icons.search, color: Colors.blueAccent),
              ),
            ),
            Flexible(
              flex: 1,
              child: FlatButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, CollectionsScreen.id),
                child: Icon(Icons.collections, color: Colors.blueAccent),
              ),
            ),
            Flexible(
              flex: 1,
              child: FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, HomeScreen.id),
                child: Icon(Icons.home, color: Colors.blueAccent),
              ),
            ),
            Flexible(
              flex: 1,
              child: FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, ProfileScreen.id),
                child: Icon(Icons.account_circle, color: Colors.blueAccent),
              ),
            ),
            Flexible(
              flex: 1,
              child: FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, ForumScreen.id),
                child: Icon(Icons.forum, color: Colors.blueAccent),
              ),
            ),
          ],
        ));
  }
}
