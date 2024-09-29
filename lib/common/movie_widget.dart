import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/api/model/movie.dart';
import 'package:movies_app/core/theming/colors.dart';
import '../AppUtils.dart';
import '../api/category_model/movies_details_response.dart';
import '../api/results.dart';
import '../features/home_screen/movies_details/movies_details.dart';
import '../firebase/MovieCollection.dart';
import 'important_url.dart';

class MovieWidget extends StatefulWidget {
  final Results? results;
  final Movie? movie;
  final int? imageHeight;
  final double? bookMarkIconSize;
  final double? addIconSize;
  final double? bookMarkIconBottomPadding;
  final double? addIconBottomPadding;
  final double? bookMarkIconRightPadding;
  final double? addIconRightPadding;
  final String? title;
  final String? imageUrl;
  final String? year;
  final String? actors;

  MovieWidget( {
    super.key,
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
    this.actors,
    this.results,
  });

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    final String? posterPath = widget.movie?.posterPath;
    final String imageUrl = posterPath != null
        ? ImportantUrl.baseImageUrl + posterPath
        : 'default_image_url';

    return Stack(
      children: [
        InkWell(
          onTap: () {
            if (widget.movie?.id != null) {
              Navigator.pushNamed(
                context,
                MoviesDetailsWidget.routeName,
                arguments: {'movieId': widget.movie?.id},
              );
            }
          },
          child: CachedNetworkImage(
            imageUrl: imageUrl, fit: BoxFit.cover,
            height: widget.imageHeight?.h ?? 200.h,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
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
            )),
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
