import 'package:cafe_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_app/screens/search_screen.dart';
import 'package:cafe_app/screens/collections_screen.dart';
import 'package:cafe_app/screens/forum_screen.dart';
import 'package:cafe_app/screens/profile_screen.dart';
import 'package:cafe_app/screens/login_screen.dart';
import 'package:cafe_app/screens/create_account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafe Finder',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TheKingScreen(),
    );
  }
}

class TheKingScreen extends StatefulWidget {
  @override
  _TheKingScreenState createState() => _TheKingScreenState();
}

class _TheKingScreenState extends State<TheKingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        CollectionsScreen.id: (context) => CollectionsScreen(),
        ForumScreen.id: (context) => ForumScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        CreateAccount.id: (context) => CreateAccount(),
      },
    );
  }
}
