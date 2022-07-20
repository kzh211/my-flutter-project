import 'package:flutter/material.dart';
import 'package:food_order_project/dummy_data.dart';
import 'package:food_order_project/meal.dart';

class MealClickScreen extends StatefulWidget {
  static const routeName = '/meal_click_screen';
  static List<Meal> favourite = [];
  const MealClickScreen({Key? key}) : super(key: key);

  @override
  State<MealClickScreen> createState() => _MealClickScreenState();
}

class _MealClickScreenState extends State<MealClickScreen> {
  Widget buildTitleContainer(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildImgCliprect(Image img) {
    return ClipRect(
      child: img,
    );
  }

  Widget buildPriceContainer(double price) {
    return Container(
      padding: EdgeInsets.only(left: 32),
      child: Text(
        '\$${price * _count}',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  void featuredMealClick(BuildContext ctx, String id) {
    Navigator.of(context).pushReplacementNamed(
      MealClickScreen.routeName,
      arguments: id,
    );
  }

  int _count = 1;
  void plusClick() {
    setState(() {
      _count += 1;
    });
  }

  void minusClick() {
    setState(() {
      if (_count == 1) {
        _count = 1;
      } else {
        _count -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.where((meal) => meal.id == routeArgs).toList().first;
    List<Meal> sameGroupMeals = DUMMY_MEALS
        .where((meal) =>
            meal.group == selectedMeal.group && meal.id != selectedMeal.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Food order'),
        actions: [
          CircleAvatar(
            radius: 23,
            backgroundColor: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset("assets/images/luffy.png"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTitleContainer(selectedMeal.title),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ////
                  buildImgCliprect(selectedMeal.img),
                  ////
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (!selectedMeal.isFavourite) {
                              selectedMeal.isFavourite = true;
                              MealClickScreen.favourite.add(selectedMeal);
                            } else {
                              selectedMeal.isFavourite = false;
                              MealClickScreen.favourite.remove(selectedMeal);
                            }
                          });
                        },
                        icon: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(
                                      1, 2), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(3)),
                          child: Icon(
                            selectedMeal.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.redAccent.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Text(
                        'Mark as favourites list meal!',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildPriceContainer(selectedMeal.price),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor.withOpacity(0.8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                    height: 60,
                    width: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 123,
                          height: 45,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: plusClick,
                                icon: Icon(Icons.add),
                              ),
                              Text(
                                _count.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: minusClick,
                                icon: Icon(Icons.remove),
                              ),
                            ],
                          ), //row
                        ),
                        Text(
                          'add to cart',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 30),
              alignment: Alignment.topLeft,
              child: Text(
                'other recommended meals based on your choice',
                style: TextStyle(
                    fontSize: 20, color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.37,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                children: [
                  ...sameGroupMeals
                      .map(
                        (meal) => InkWell(
                          onTap: () => featuredMealClick(context, meal.id),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      meal.color.withOpacity(0.5),
                                      meal.color.withOpacity(0.8),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: ClipRect(
                                child: meal.img,
                              ),
                            ),
                            title: Text(
                              meal.title,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            subtitle: Text(
                              '\$${meal.price}',
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
