import 'package:flutter/material.dart';
import 'package:food_order_project/meal_click_screen.dart';
import 'package:food_order_project/start_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Order',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.orange,
        fontFamily: 'BaksoSapi',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 13.0, fontStyle: FontStyle.italic),
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => startScreen(),
        MealClickScreen.routeName: ((context) => MealClickScreen()),
      },
    );
  }
}
