import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.search, 0),
          buildNavBarItem(Icons.supervised_user_circle, 1),
          buildNavBarItem(Icons.home, 2),
          buildNavBarItem(Icons.collections, 3),
          buildNavBarItem(Icons.forum, 4),
        ],
      ),
      appBar: AppBar(
        title: Text('Cafe Finder'),
      ),
      body: Center(child: Text('c**')),
    );
  }

  GestureDetector buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
            color: index == _selectedItemIndex ? Colors.green : Colors.blue),
        child: Icon(icon),
      ),
    );
  }
}
