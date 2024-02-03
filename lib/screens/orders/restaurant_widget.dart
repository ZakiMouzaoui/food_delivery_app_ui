import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/models/restaurant_model.dart';

import '../../constants/colors.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: AssetImage(restaurant.image), fit: BoxFit.cover)),
          width: 100.w,
          height: 90.h,
        ),
        SizedBox(
          width: 15.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(left: 3.w),
              child: Text(restaurant.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                      fontSize: 15.sp)),
            ),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: AppColors.primaryColor,
                ),
                Text(
                  "${restaurant.rating}",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "(${restaurant.totalRatings} ratings)",
                  style: TextStyle(
                      color: AppColors.placeholderColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: AppColors.primaryColor,
                ),
                Text(
                  "Hai El Akid Lotfi",
                  style: TextStyle(
                      color: AppColors.placeholderColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
