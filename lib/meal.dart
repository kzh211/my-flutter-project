import 'package:flutter/cupertino.dart';

enum Group {
  SandwichType,
  SweetSnackType,
  JuiceType,
}

class Meal {
  final String id;
  final String title;
  final double price;
  final Image img;
  final Group group;
  final Color color;
  final bool recommend;
  bool isFavourite;
  Meal({
    required this.id,
    required this.title,
    required this.price,
    required this.img,
    required this.group,
    required this.color,
    required this.recommend,
    required this.isFavourite,
  });
}
