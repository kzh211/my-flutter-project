import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order_project/meal.dart';

var DUMMY_MEALS = [
  Meal(
    id: 'm1',
    title: 'hamburger',
    price: 5,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f354.png')),
    color: Colors.orangeAccent,
    group: Group.SandwichType,
    recommend: true,
    isFavourite: false,
  ),
  Meal(
    id: 'm2',
    title: 'pizza',
    price: 2,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f355.png')),
    color: Colors.yellowAccent,
    group: Group.SandwichType,
    recommend: true,
    isFavourite: false,
  ),
  Meal(
    id: 'm3',
    title: 'french fries',
    price: 1.5,
    img: Image(
        image: NetworkImage(
            'https://hotemoji.com/images/dl/x/french-fries-emoji-by-google.png')),
    color: Colors.cyanAccent,
    group: Group.SweetSnackType,
    recommend: true,
    isFavourite: false,
  ),
  Meal(
    id: 'm4',
    title: 'milkShake',
    price: 2,
    img: Image(
        image: NetworkImage(
            'https://icon-library.com/images/milkshake-icon/milkshake-icon-29.jpg')),
    color: Colors.redAccent,
    group: Group.JuiceType,
    recommend: true,
    isFavourite: false,
  ),
  Meal(
    id: 'm5',
    title: 'fresh juice',
    price: 3,
    img: Image(
        image: NetworkImage(
            'https://toppng.com/public/uploads/thumbnail/tropical-drink-icon-drink-emoji-transparent-background-11562957717fri2onoxcc.png')),
    color: Colors.purpleAccent,
    group: Group.JuiceType,
    recommend: true,
    isFavourite: false,
  ),
  Meal(
    id: 'm6',
    title: 'taco',
    price: 1.5,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/google/android-pie/512px/1f32e.png')),
    color: Colors.greenAccent,
    group: Group.SandwichType,
    recommend: false,
    isFavourite: false,
  ),
  Meal(
    id: 'm7',
    title: 'pie',
    price: 2,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/twitter/512px/1f967.png')),
    color: Colors.amberAccent,
    group: Group.SweetSnackType,
    recommend: true,
    isFavourite: false,
  ),
  Meal(
    id: 'm8',
    title: 'hot dog',
    price: 2.5,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/google/android-pie/512px/1f32d.png')),
    color: Colors.blueAccent,
    group: Group.SandwichType,
    recommend: false,
    isFavourite: false,
  ),
  Meal(
    id: 'm9',
    title: 'sandwich',
    price: 1.5,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/twitter/512px/1f96a.png')),
    color: Colors.grey,
    group: Group.SandwichType,
    recommend: false,
    isFavourite: false,
  ),
  Meal(
    id: 'm10',
    title: 'donut',
    price: 1,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/twitter/v13.1/512px/1f369.png')),
    color: Colors.pinkAccent,
    group: Group.SweetSnackType,
    recommend: false,
    isFavourite: false,
  ),
  Meal(
    id: 'm11',
    title: 'cola',
    price: 1.5,
    img: Image(
        image: NetworkImage(
            'https://icon-library.com/images/soda-icon/soda-icon-10.jpg')),
    color: Colors.indigoAccent,
    group: Group.JuiceType,
    recommend: false,
    isFavourite: false,
  ),
  Meal(
    id: 'm12',
    title: 'meat',
    price: 8,
    img: Image(
        image: NetworkImage(
            'https://images.emojiterra.com/google/android-11/512px/1f969.png')),
    color: Colors.black12,
    group: Group.SandwichType,
    recommend: false,
    isFavourite: false,
  ),
];
