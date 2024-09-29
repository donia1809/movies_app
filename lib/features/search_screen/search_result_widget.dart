import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api/model/movie.dart';
import '../../common/important_url.dart';
import '../../common/movie_widget.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/text_style.dart';

class SearchResultWidget extends StatelessWidget
{
  final Movie? movie;

  const SearchResultWidget({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          SizedBox( width: 60.w,height: 90.h,
            child: CachedNetworkImage(
              imageUrl:ImportantUrl.baseImageUrl+(movie?.posterPath??''),
              height:  MovieWidget().imageHeight?.h,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
              Icon(Icons.error, color: AppColors.red),
            ),
          )

          ,SizedBox(width: 10.w)
          ,Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie?.title??'no title founded',
                  style: TextStyleApp.font14weight400colorWhite,),
                SizedBox(width: 10.w),
                Text( movie?.releaseDate??'no date founded',
                  style: TextStyleApp.font14weight400colorWhite.copyWith(color:Colors.white.withOpacity(.67)),),
              ],
            ),
          )
        ],
      ),
    );
  }

}