import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';


class FoodCategoryCard extends StatelessWidget {
  const FoodCategoryCard({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 5.h,),
        Text(title, style: TextStyle(color: AppColors.primaryTextColor, fontSize: 14.sp, fontWeight: FontWeight.bold),)
      ],
    );
  }
}
