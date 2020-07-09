import 'package:flutter/material.dart';
import '../components/nav_bar.dart';

class SearchScreen extends StatelessWidget {
  static const String id = "search_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cafe Finder")),
      bottomNavigationBar: NavBar(),
      body: Text('search'),
    );
  }
}
