import 'package:flutter/material.dart';
import '../components/nav_bar.dart';

class CollectionsScreen extends StatelessWidget {
  static const String id = "collection_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cafe Finder")),
      bottomNavigationBar: NavBar(),
      body: Text('collections'),
    );
  }
}
