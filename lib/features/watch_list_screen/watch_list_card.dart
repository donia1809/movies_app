import 'package:flutter/material.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/date_utils.dart';
import '../../api/model/home_model/movie.dart';
import '../../common/movie_widget.dart';
import '../../core/theming/text_style.dart';

class WatchListCard extends StatelessWidget {
  Movie movie;

  WatchListCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MovieWidget(
            movie: movie,
            imageHeight: 120,
            addIconSize: 18,
            addIconBottomPadding: 85,
            addIconRightPadding: 92,
            bookMarkIconRightPadding: 102,
            bookMarkIconBottomPadding: 94,
          ),
        )),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${movie.title}',
                style: TextStyle(color: AppColors.white),
              ),
              Text('${movie.releaseDate?.formatDate}',
                  style: TextStyleApp.font14weight400colorWhite
                      .copyWith(color: Colors.white.withOpacity(.67)))
            ],
          ),
        )
      ],
    );
  }
}
