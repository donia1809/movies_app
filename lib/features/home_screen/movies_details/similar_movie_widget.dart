import 'package:flutter/material.dart';
import 'package:movies_app/api/similar_model/Results.dart';
import 'package:movies_app/common/MovieWidget.dart';
import '../../../api/model/Movie.dart';
import '../../../common/DetailsMovieWidget.dart';
import '../../../common/ImportantUrl.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/text_style.dart';

class SimilarMovieWidget extends StatelessWidget {
  final List<Results>? similarMovies;
  final Results? results;
  Movie? movie;

  SimilarMovieWidget({
    super.key,
    this.movie,
    this.results,
     this.similarMovies
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 8),
      height: 300,
      color: AppColors.blackWithOpacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('More Like That', style: TextStyleApp.font14weight400colorWhite),
          const SizedBox(height: 15),
          Expanded(
            child:ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 6),
                itemCount: similarMovies?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movieResult = similarMovies![index];
                  return DetailsMovieWidget(
                    result: movieResult,
                    movie:  Movie(
                      posterPath: movieResult.posterPath != null && movieResult.posterPath!.isNotEmpty
                      ? ImportantUrl.BaseImageUrl + movieResult.posterPath!
                          : null,))

                  ;
                }),
          ),
        ],
      ),
    );
  }
}
