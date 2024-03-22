import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex=0;
  final List<Meal> _favoriteMeal=[];

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)
        )
    );
  }

  void _toggleMealFavStatus(Meal meal){
    final isExist=_favoriteMeal.contains(meal);
    if(isExist) {
      setState(() {
        _favoriteMeal.remove(meal);
        _showInfoMessage('Meal is no longer a Favorite');
      });
    }else{
      setState(() {
        _favoriteMeal.add(meal);
        _showInfoMessage('Market as a Favorite');
      });
    }

  }

  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
}
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFav:_toggleMealFavStatus,);
    var activePageTitle = 'Categories';

    if(_selectedPageIndex==1){
      activePage = MealsScreen(
        meals: _favoriteMeal,
        onToggleFav: _toggleMealFavStatus,);
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites'),
        ],
      ),
    );
  }
}
