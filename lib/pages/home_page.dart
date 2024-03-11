import 'package:flutter/material.dart';
import '../data/names.dart'; // Import the names file
import '../data/liked_cards.dart'; // Import the liked cards file
import 'dynamic_page.dart'; // Import the DynamicPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: names.length,
        itemBuilder: (context, index) {
          final name = names[index];
          final isLiked = LikedCards.isLiked(index);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DynamicPage(name: name),
                ),
              );
            },
            child: Container(
              height: 130,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(30.0),
                        child: Chip(
                          label: Text('${name.name}'), // Display unique number before name
                          shadowColor: Colors.blue,
                          backgroundColor: Colors.green,
                          elevation: 10,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      IconButton(
                        icon: isLiked
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            LikedCards.toggleLiked(index, name);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
