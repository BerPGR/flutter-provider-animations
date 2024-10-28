import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/filters.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:mealsapp/providers/favorites_provider.dart';
import 'package:mealsapp/providers/filters_provider.dart';

const kInitialFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false
  };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;


  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filter') {
      Navigator.of(context)
        .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    }
    else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {  

    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = Categories(availableMeals: availableMeals,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {

      final favoriteMeals = ref.watch(favoritesMealProvider);

      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectedScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal), 
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star), label: "Favorites"
          ),
        ] 
      ),
    );
  }
}