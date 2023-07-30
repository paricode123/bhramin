import 'package:bhramin/screens/home.dart';
import 'package:bhramin/screens/post.dart';
import 'package:bhramin/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomPage extends StatefulWidget {
  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _currentIndex = 0;

  // List of your different pages as widgets
  final List<Widget> _pages = [
    HomePage(),
    PostPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFFf4dcb0), // Customize the background color
        color: Colors.white, // Customize the active item color
        buttonBackgroundColor: Color(0xFFf4dcb0), // Customize the background color of the active item
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.person, size: 30),
        ],
      ),
    );
  }
}