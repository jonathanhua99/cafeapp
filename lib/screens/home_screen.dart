import 'package:flutter/material.dart';
import '../components/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cafe Finder")),
      bottomNavigationBar: NavBar(),
      body: Text('home'),
    );
  }
}
