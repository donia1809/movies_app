import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/theming/colors.dart';

class TextStyleApp {
  static TextStyle styleText(double size, Color color, FontWeight fw) {
    return GoogleFonts.poppins(color: color, fontSize: size.sp, fontWeight: fw);
  }

  static TextStyle font32weight700ColorBlue = TextStyle(
    fontSize: 32.sp,
    fontFamily: 'Poppins-.ttf',
    fontWeight: FontWeight.w700,
    height: 0.05,
    color: AppColors.black,
  );


  static TextStyle font14weight400colorGrey = TextStyle(
    color: AppColors.black,
    fontSize: 14.sp,
    fontFamily: 'Poppins-.ttf',
    fontWeight: FontWeight.w400,
  );
 static TextStyle font16weight400colorWhite = TextStyle(
   color: AppColors.white,
   fontSize: 16.sp,
   fontFamily: 'Inter',
   fontWeight: FontWeight.w400
 );
static TextStyle font10weight400colorWhite = TextStyle(
   color: AppColors.white,
   fontSize: 10.sp,
   fontFamily: 'Inter',
   fontWeight: FontWeight.w400
 );
static TextStyle font14weight400colorWhite = TextStyle(
   color: AppColors.white,
   fontSize: 14.sp,
   fontFamily: 'Inter',
   fontWeight: FontWeight.w400
 );
static TextStyle font8weight400colorGrey2 = TextStyle(
   color: AppColors.grey2,
   fontSize: 8.sp,
   fontFamily: 'Inter',
   fontWeight: FontWeight.w400
 );

}
