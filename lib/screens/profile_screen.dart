import 'package:flutter/material.dart';
import '../components/nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = "profile_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cafe Finder making changes")),
      bottomNavigationBar: NavBar(),
      body: Text('profile'),
    );
  }
}
