import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/date_utils.dart';
import 'package:movies_app/common/movie_widget.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/core/theming/text_style.dart';
import '../api/model/movie.dart';
import '../api/results.dart';

class DetailsMovieWidget extends StatelessWidget {
  const DetailsMovieWidget({super.key, this.movie, this.result});

  final Movie? movie;
  final Results? result;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: Colors.transparent),
      ),
      elevation: 4,
      surfaceTintColor: AppColors.blackWithOpacity,
      color: AppColors.blackWithOpacity,
      child: SizedBox(
        height: 185,
        width: 85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          MovieWidget(
            movie: movie,
            imageHeight: 120,
            bookMarkIconBottomPadding: 90,
            bookMarkIconSize: 40,
            bookMarkIconRightPadding: 50,
            addIconBottomPadding: 85,
            addIconRightPadding: 45,
            addIconSize: 18,
          ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Icon(Icons.star, color: AppColors.yellow1, size: 12),
                Text(
                  result?.voteAverage?.toStringAsFixed(1) ?? 'No Rating',
                  style: TextStyleApp.font10weight400colorWhite,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              result?.title ?? 'Unknown Title',
              style: TextStyleApp.font10weight400colorWhite,
            ),
            const SizedBox(height: 8),
            Text(
              '${result?.releaseDate?.formatDate() ?? 'Unknown Date'}  ${result?.adult == true ? 'R' : 'G'}',
              textAlign: TextAlign.start,
              style: TextStyleApp.font8weight400colorGrey2,
            ),
          ],
        ),
      ),
    );
  }
}
