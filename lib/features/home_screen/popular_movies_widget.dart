import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/date_utils.dart';
import 'package:movies_app/common/important_url.dart';
import 'package:movies_app/common/movie_widget.dart';
import 'package:movies_app/core/theming/text_style.dart';
import '../../api/model/home_model/movie.dart';
import '../../core/theming/colors.dart';

class PopularMoviesWidget extends StatelessWidget {
  PopularMoviesWidget(this.movie,{super.key});
  Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 580.h,
          color: const Color(0xff131313),
          child: Column(

            children: [
              Container(
                color: Colors.black,
                height: 230.h,
                width: double.infinity,
                child: Image(

                    fit: BoxFit.fill,
                    image: NetworkImage(ImportantUrl.baseImageUrl+movie!.posterPath!)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(150.w,10,0,15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(movie?.title??'',style:TextStyleApp.font16weight400colorWhite ,),
                    SizedBox(height: 10.h,),
                    Text('${movie?.releaseDate?.formatDate()}  ${movie!.adult??false?'R':'G'}',
                      style:TextStyleApp.font10weight400colorWhite,
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
         Center(child: Icon(Icons.play_circle_fill, size: 80,color: AppColors.white,)),
        Positioned(top: 120,
            child: MovieWidget( imageHeight: 210,movie: movie,bookMarkIconSize: 100,addIconSize: 18,
              bookMarkIconBottomPadding: 142, bookMarkIconRightPadding: 78,
              addIconBottomPadding: 170, addIconRightPadding: 105,))
      ],
    );
  }
}