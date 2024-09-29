import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/api/model/Movie.dart';
import 'package:movies_app/api/similar_model/Results.dart';
import 'package:movies_app/core/theming/colors.dart';
import '../features/home_screen/movies_details/movies_details.dart';
import 'ImportantUrl.dart';

class MovieWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final String? posterPath = movie?.posterPath;
    final String imageUrl = posterPath != null
        ? ImportantUrl.BaseImageUrl + posterPath
        : 'default_image_url';

    return Stack(
      children: [
        InkWell(
          onTap: () {
            if (movie?.id != null) {
              Navigator.pushNamed(
                context,
                MoviesDetails.routeName,
                arguments: {'movieId': movie?.id},
              );
            }
          },
          child: CachedNetworkImage(
            imageUrl: imageUrl, fit: BoxFit.cover,
            height: imageHeight?.h ?? 200.h,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: bookMarkIconBottomPadding?.h ?? 10.h,
          right: bookMarkIconRightPadding?.w ?? 10.w,
          child: Opacity(
            opacity: 1,
            child: ImageIcon(
              size: bookMarkIconSize ?? 24,
              color: AppColors.grey,
              const AssetImage('assets/images/Icon awesome-bookmark.png'),
            ),
          ),
        ),
        Positioned(
          bottom: addIconBottomPadding?.h ?? 10.h,
          right: addIconRightPadding?.w ?? 10.w,
          child: IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.add, size: addIconSize ?? 24),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
