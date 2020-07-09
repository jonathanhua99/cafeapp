import 'package:flutter/material.dart';
import '../components/nav_bar.dart';

class ForumScreen extends StatelessWidget {
  static const String id = "forum_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cafe Finder")),
      bottomNavigationBar: NavBar(),
      body: Text('forums'),
    );
  }
}
