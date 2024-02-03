import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class AppTheme{
  static final textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryTextColor
    ),
    displayMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTextColor
    ),
    titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryTextColor
    ),
  );
}
