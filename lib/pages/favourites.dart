import 'package:flutter/material.dart';
import '../data/liked_cards.dart'; // Import the liked cards file
import '../data/names.dart'; // Import the names file

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: LikedCards.likedCards.length,
        itemBuilder: (context, index) {
          final likedCardIndex = LikedCards.likedCards.keys.elementAt(index);
          final name = names[likedCardIndex];
          final isLiked = LikedCards.isLiked(likedCardIndex);

          return Container(
            height: 130,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Remove from Favorites?'),
                              content: Text('Are you sure you want to remove ${name.name} from favorites?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Remove'),
                                  onPressed: () {
                                    setState(() {
                                      LikedCards.toggleLiked(likedCardIndex, name);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(30.0),
                        child: Chip(
                          label: Text('${name.name}'),
                          shadowColor: Colors.blue,
                          backgroundColor: Colors.green,
                          elevation: 10,
                        ),
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
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Remove from Favorites?'),
                              content: Text('Are you sure you want to remove ${name.name} from favorites?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Remove'),
                                  onPressed: () {
                                    setState(() {
                                      LikedCards.toggleLiked(likedCardIndex, name);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
