import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResult extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 50.h, vertical: 50.w),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 200.h),
          child: Column(
            children: [
              Image.asset(('assets/images/icon_movies.png')),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'No movies found',
                style: TextStyle(
                    color: Colors.white.withOpacity(.67)),
              ),
            ],
          ),
        ));
  }

}