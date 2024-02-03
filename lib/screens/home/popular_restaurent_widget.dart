import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';

class PopularRestaurantWidget extends StatelessWidget {
  const PopularRestaurantWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.rating,
      required this.totalRatings});

  final String image;
  final String title;
  final double rating;
  final int totalRatings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          height: 190.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low
            )
          ),

        ),
        SizedBox(
          height: 5.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryTextColor, fontSize: 15.sp),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: AppColors.primaryColor,
              ),
              Text(
                "$rating",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "($totalRatings ratings)",
                style: TextStyle(
                    color: AppColors.placeholderColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ]),
      ],
    );
  }
}
