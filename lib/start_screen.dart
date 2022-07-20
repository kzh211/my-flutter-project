import 'package:flutter/material.dart';
import 'package:food_order_project/drawer_screen.dart';
import 'package:food_order_project/dummy_data.dart';
import 'package:food_order_project/meal.dart';
import 'package:food_order_project/meal_click_screen.dart';

class startScreen extends StatefulWidget {
  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  List<Meal> _RECOMMEND_MEALS =
      DUMMY_MEALS.where((meal) => meal.recommend == true).toList();
  List<Meal> _NON_RECOMMENDED_MEALS =
      DUMMY_MEALS.where((meal) => meal.recommend == false).toList();

  final controller = TextEditingController();

  Widget container = Container(
    padding: EdgeInsets.only(left: 10),
    alignment: Alignment.centerLeft,
    child: Text(
      'Recommended meals',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black.withOpacity(0.6),
      ),
    ),
  );

  void selectMeal(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      MealClickScreen.routeName,
      arguments: id,
    );
  }

  void textfieldAction(String text) {
    setState(() {
      if (text.isEmpty) {
        container = Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            'Recommended meals',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        );
      } else {
        List<Meal> containMeal = DUMMY_MEALS
            .where(
                (meal) => meal.title.toLowerCase().contains(text.toLowerCase()))
            .toList();
        print(containMeal.length);
        if (containMeal.length == 0) {
          container = Center(child: Text('No result'));
        } else {
          container = Container(
            height: 150,
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () => selectMeal(context, containMeal[index].id),
                    child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  containMeal[index].color.withOpacity(0.5),
                                  containMeal[index].color.withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: ClipRect(
                            child: containMeal[index].img,
                          ),
                        ),
                        title: Text(
                          containMeal[index].title,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        subtitle: Text(
                          '\$${containMeal[index].price}',
                        )),
                  );
                }),
                separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                itemCount: containMeal.length),
          );
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Recommended meals',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          );
        }
      }
    });
  }

  Widget tabBarsItemsbuilder(List<Meal> meal, Icon icon) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return Container(
            padding: EdgeInsets.only(top: 10),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    meal[index].color.withOpacity(0.5),
                    meal[index].color.withOpacity(0.8),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: ClipRect(
                  child: meal[index].img,
                ),
              ),
              title: Text(
                meal[index].title,
                style: Theme.of(context).textTheme.headline2,
              ),
              subtitle: Text(
                '\$${meal[index].price}',
              ),
              trailing: IconButton(
                onPressed: () => selectMeal(context, meal[index].id),
                icon: icon,
                iconSize: 37,
                color: Theme.of(context).accentColor.withOpacity(0.7),
              ),
            ),
          );
        }),
        separatorBuilder: (ctx, index) => SizedBox(
              height: 1,
            ),
        itemCount: meal.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
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
          drawer: drawerScreen(),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Text(
                  'Search for recipes',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: controller,
                  onChanged: textfieldAction,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              container,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: MediaQuery.of(context).size.height * 0.30,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((ctx, index) {
                      return InkWell(
                        onTap: () =>
                            selectMeal(context, _RECOMMEND_MEALS[index].id),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      _RECOMMEND_MEALS[index]
                                          .color
                                          .withOpacity(0.5),
                                      _RECOMMEND_MEALS[index]
                                          .color
                                          .withOpacity(0.8)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(20)),
                            width: 115,
                            height: 30,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: _RECOMMEND_MEALS[index].img,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  _RECOMMEND_MEALS[index].title,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$${_RECOMMEND_MEALS[index].price}',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ],
                            )),
                      );
                    }),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: _RECOMMEND_MEALS.length),
              ),
              SizedBox(
                height: 48,
                child: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  bottom: TabBar(tabs: [
                    Tab(
                      text: 'other meals',
                    ),
                    Tab(
                      text: 'favourites meals',
                    ),
                  ]),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                    height: 300,
                    child: TabBarView(
                      children: [
                        tabBarsItemsbuilder(_NON_RECOMMENDED_MEALS,
                            Icon(Icons.add_shopping_cart)),
                        MealClickScreen.favourite.length > 0
                            ? tabBarsItemsbuilder(
                                MealClickScreen.favourite,
                                Icon(
                                  Icons.favorite,
                                ),
                              )
                            : Center(
                                child: Text('No favourite yet.. Add sum!'),
                              ),
                      ],
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
