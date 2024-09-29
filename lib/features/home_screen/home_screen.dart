import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/api/apimanager.dart';
import 'package:movies_app/features/home_screen/NewReleasesWidget.dart';
import 'package:movies_app/features/home_screen/RecommendedMoviesWidget.dart';

import 'PopularMoviesWidget.dart';

class HomeScreen extends StatelessWidget
{
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
 return FutureBuilder(future: ApiManager.getPopularMovies()
     , builder:  (context, snapshot) {
     if(snapshot.connectionState==ConnectionState.waiting){
       return const Center(child: CircularProgressIndicator());

     } if(snapshot.hasError){
       return const Center(child: Text('Something went wrong' , style: TextStyle( color: Colors.white),));
     }
       return SingleChildScrollView(
         child: Column(
          children: [
            CarouselSlider.builder(itemCount:3
                , itemBuilder: (context, index, realIndex) => PopularMoviesWidget(
                snapshot.data?.popularMovies![index]
                )
               , options:  CarouselOptions(
                   autoPlay: true,
                  height: 330.h,
                  viewportFraction: 1
                )),
           const NewReleasesWidget(),
            const SizedBox( height: 30,),
           const RecommendedMoviesWidget()
           ],
         ),
       );;
  });

}}