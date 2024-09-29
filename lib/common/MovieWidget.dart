import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/AppUtils.dart';
import 'package:movies_app/api/model/Movie.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/features/watch_list_screen/watch_list.dart';
import 'package:movies_app/firebase/MovieCollection.dart';

import '../features/home_screen/movies_details/movies_details.dart';
import 'ImportantUrl.dart';

class MovieWidget extends StatefulWidget {
  Movie? movie;
  int? imageHeight;
  double? bookMarkIconSize;
  double? addIconSize;
  double? bookMarkIconBottomPadding;
  double? addIconBottomPadding;
  double? bookMarkIconRightPadding;
  double? addIconRightPadding;
  final String? title;
  final String? imageUrl;
  final String? year;
  final String? actors;


  MovieWidget({super.key,
    this.movie,
    this.imageHeight,
    this.bookMarkIconSize,
    this.addIconSize,
    this.bookMarkIconBottomPadding,
    this.bookMarkIconRightPadding,
    this.addIconBottomPadding,
    this.addIconRightPadding,
    this.title,
    this.imageUrl,
    this.year,
    this.actors,});

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
       InkWell(
         onTap: (){
           Navigator.pushNamed(context, MoviesDetails.routeName);
         },
         child: CachedNetworkImage(imageUrl:ImportantUrl.BaseImageUrl+widget.movie!.posterPath!,
         height: widget.imageHeight?.h,),
       ) ,
        Positioned(
          bottom:widget.bookMarkIconBottomPadding?.h ,
          right: widget.bookMarkIconRightPadding?.w ,
          child: Opacity(
            opacity: 1,
            child: ImageIcon(
                size: widget.bookMarkIconSize,
                color:  widget.movie!.watchLater!? AppColors.yellow1:
                Color(0xff514F4F)
                ,
                const AssetImage(
                  'assets/images/Icon awesome-bookmark.png',
                )),
          ),
        ),
        Positioned(
          bottom: widget.addIconBottomPadding?.h,
          right: widget.addIconRightPadding?.w,
          child: IconButton(onPressed:widget.movie!.watchLater!?null:() {
           AddmovietoWatchlaterList();
          }, icon: widget.movie!.watchLater!?Icon(Icons.check,size: widget.addIconSize,
            color: Colors.white,):Icon(Icons.add, color: Colors.white,size: widget.addIconSize,)
        ))
      ],
    );
  }
  AddmovietoWatchlaterList()async{
    try{
      showLoadingdialog(context);
     await AddmovietoWatchList(widget.movie!);
     await UpdateMovie(widget.movie!);
    hideLoadingdialog(context);
    widget.movie?.watchLater = true;
    setState(() {

    });
  }catch(e){
      showMessageDialog(context,  () {
        AddmovietoWatchlaterList();
      },);

    }
  }
}