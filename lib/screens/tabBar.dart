import 'package:flutter/material.dart';
import 'package:meal_appp/providers/themes_provider.dart';
import '../providers/meal.dart';
import '../widget/main_drawer.dart';
import './favorites_screen.dart';
import './category_screen.dart';
import 'package:provider/provider.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);
  static const routName = "/";

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Map<String, Object>> _pages=[];

  int _pageIndex = 0;

  void _selectedPages(int value) {
    setState(() {
      _pageIndex = value;
    });
  }

  @override
  void initState() {
    Provider.of<MealProvider>(context, listen: false).getData();
    Provider.of<ThemesProvider>(context, listen: false).getThemeMode();
    // Provider.of<ThemesProvider>(context, listen: false).getThemeColor();
    _pages = [
      {'page': const CategoryScreen(), 'title': 'Categories'},
      {'page': const FavoritesScreen(), 'title': 'Favorites'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_pageIndex]['title'].toString()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Provider.of<ThemesProvider>(context).primaryColor,
        currentIndex: _pageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor:Provider.of<ThemesProvider>(context).accentColor,
        onTap: _selectedPages,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
      body: _pages[_pageIndex]['page'] as Widget,
      drawer:  MainDrawer(),
    );
  }
}
