import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'pages/home_page.dart';
import 'pages/favourites.dart' as fav;
import 'pages/search.dart' as sear;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    fav.Favourites(),
    sear.Search(),
  ];

  // Add a list of tab names
  final List<String> _tabNames = [
    'Home',
    'Favourites',
    'Search',
  ];

  void _handleIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
      title: Text(_tabNames[_currentIndex]),
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.purple, Colors.red],
        ),
      ),
      backgroundColor: Colors.lightBlue[100],
      body: _children[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: Colors.red,
            ),
            CrystalNavigationBarItem(
                icon: IconlyBold.search,
                unselectedIcon: IconlyLight.search,
                selectedColor: Colors.white),
          ],
        ),
      ),
    );
  }
}