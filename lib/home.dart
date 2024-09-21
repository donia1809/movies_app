import 'package:flutter/material.dart';
import 'package:movies_app/features/home_screen/home_screen.dart';
import 'package:movies_app/features/search_screen/search_screen.dart';
import 'core/theming/colors.dart';
import 'features/categories_screen/category_screen.dart';
import 'features/watch_list_screen/watch_list.dart';


////////////////////////////////////////////////////

class Home extends StatefulWidget {
  static const String routeName = '?';

  @override
  State<Home> createState() => _HomeState();
}

////////////////////////////////////////////////////

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  var tab = [HomeScreen(), SearchScreen(), CategoryScreen(), WatchListScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/home.png')), label:'HOME', backgroundColor: AppColors.black,),
             BottomNavigationBarItem(icon: Icon(Icons.search), label:'SEARCH', backgroundColor: AppColors.black,),
             BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/Icon material-movie.png')), label:'BROWSE',backgroundColor: AppColors.black, ),
             BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon-bookmarks.png')), label:'WATCHELIST' ,backgroundColor: AppColors.black,)
          ],
        ),
        body: tab[selectedIndex],

    );
  }
}
