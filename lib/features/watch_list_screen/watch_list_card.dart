import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/DateUtils.dart';
import 'package:movies_app/api/model/Movie.dart';
import 'package:movies_app/common/DetailsMovieWidget.dart';
import 'package:movies_app/common/ImportantUrl.dart';
import 'package:movies_app/common/MovieWidget.dart';
import 'package:movies_app/core/theming/colors.dart';

import '../../core/theming/text_style.dart';
class WatchListCard extends StatelessWidget {

  Movie movie;
  
   WatchListCard({
  required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: MovieWidget( movie: movie, imageHeight: 120,
            addIconSize: 18,addIconBottomPadding: 85, addIconRightPadding: 92,
          bookMarkIconRightPadding: 102, bookMarkIconBottomPadding: 94,),
        )),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${movie.title}',style: TextStyle(
              color: Colors.white
            ),),
            Text('${movie.releaseDate?.formatDate()}',
              style: TextStyleApp.font14weight400colorWhite.copyWith(color:Colors.white.withOpacity(.67)))
          ],
        ),
          flex: 2,
        )
      ],
    );
  }
}
