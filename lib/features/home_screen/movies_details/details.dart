import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/core/theming/text_style.dart';
import '../../../api/details_model/details_response.dart';

class DetailsWidget extends StatelessWidget {
  final DetailsResponse details;

  const DetailsWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final int movieId = arguments!['movieId'];
    print('movieId: $movieId');

    return SizedBox(
      width: 412.w,
      height: 492.h,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.center,
                  children: [
                SizedBox(
                  width: double.infinity,
                  height: 230.h,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${details.backdropPath}',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                 Center(
                    child: Icon(
                  Icons.play_circle_fill,
                  size: 70,
                  color: AppColors.white,
                ))
              ]),
              const SizedBox(height: 8),
              Text(
                details.title ?? 'No title available',
                style: TextStyleApp.font14weight400colorWhite
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                details.releaseDate ?? 'No Release Date',
                style: TextStyleApp.font14weight400colorWhite
                    .copyWith(color: AppColors.grey2),
              ),
              const SizedBox(height: 8),
              Text(
                details.overview ?? 'No overview available',
                style: TextStyleApp.font14weight400colorWhite
                    .copyWith(color: AppColors.grey2),
              ),
              const SizedBox(height: 8),
              Text(
                details.genres?.map((g) => g.name).join(', ') ??
                    'No genres available',
                style: TextStyleApp.font14weight400colorWhite
                    .copyWith(color: AppColors.grey2),
              ),
              // ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.yellow2,
                    size: 30,
                  ),
                  Text(
                    details.voteAverage?.toString() ?? 'No Vote Average',
                    style: TextStyleApp.font10weight400colorWhite
                        .copyWith(fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
