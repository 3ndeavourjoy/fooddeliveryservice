import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/components/my_description_box.dart';
import 'package:fooddeliveryservice/components/my_drawer.dart';
import 'package:fooddeliveryservice/components/my_sliver_app_bar.dart';
import 'package:fooddeliveryservice/components/my_current_location.dart';
import 'package:fooddeliveryservice/components/my_tab_bar.dart';
import 'package:fooddeliveryservice/models/food.dart';
import 'package:fooddeliveryservice/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:fooddeliveryservice/components/my_food_tile.dart';
import 'package:fooddeliveryservice/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }
  //sort the food category


  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return the sort

  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          //  food UI MENU
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),


                // currecnt location Text("Try now"),
                const MyCurrentLocation(),

                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
