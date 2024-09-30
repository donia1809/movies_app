import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theming/theme.dart';
import 'package:movies_app/features/splash_screen/splash_screen.dart';
import 'features/categories_screen/category_screen.dart';
import 'features/home_screen/home_screen.dart';
import 'features/home_screen/movies_details/movies_details.dart';
import 'features/search_screen/search_screen.dart';
import 'features/watch_list_screen/watch_list.dart';
import 'home.dart';


class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Movies App',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          WatchListScreen.routeName: (context) =>  const WatchListScreen(),
          CategoryScreen.routeName: (context) => const CategoryScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          Home.routeName: (context) =>  const Home(),
          MoviesDetailsWidget.routeName: (context) =>  MoviesDetailsWidget(),

        },
        theme: Theming.darkTheme,
      ),
    );
  }
}
