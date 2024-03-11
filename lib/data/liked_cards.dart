import 'package:flutter/material.dart';

class LikedCards {
  static Map<int, dynamic> _likedCards = {};

  static bool isLiked(int index) {
    return _likedCards.containsKey(index);
  }

  static void toggleLiked(int index, dynamic element) {
    if (_likedCards.containsKey(index)) {
      _likedCards.remove(index);
    } else {
      _likedCards[index] = element;
    }
  }

  static Map<int, dynamic> get likedCards => _likedCards;
}
