import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';


class RecentFoods extends StatelessWidget {
  const RecentFoods({super.key, required this.image, required this.title, required this.category, required this.rating});

  final String image;
  final String title;
  final String category;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(width: 10.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryTextColor, fontSize: 15.sp)),
            SizedBox(height: 5.h,),
            Text(category, style: TextStyle(
              color: AppColors.placeholderColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold
            ),),
            Row(
              children: [
                Icon(Icons.star,color: AppColors.primaryColor, size: 15.sp,),
                Text("$rating", style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),)
              ],
            )
          ],
        )
      ],
    );
  }
}
