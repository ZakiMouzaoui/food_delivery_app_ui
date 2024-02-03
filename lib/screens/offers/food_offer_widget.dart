import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/models/dessert_model.dart';

import '../../constants/colors.dart';


class FoodOfferWidget extends StatelessWidget {
  const FoodOfferWidget({super.key, required this.model});

  final DessertModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.image),
              fit: BoxFit.cover
            )
          ),
        ),
        SizedBox(height: 5.h,),

          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.primaryTextColor, fontSize: 15.sp),),
                Row(
                  children: [

                    const Icon(Icons.star, color: AppColors.primaryColor),
                    SizedBox(width: 5.w),
                    Text("${model.rating}", style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600),),
                    SizedBox(width: 5.w,),
                    Container(width: 5, height: 5, decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor
                    ),),
                    SizedBox(width: 5.w,),
                    Text(model.category, style: const TextStyle(
                        color: AppColors.placeholderColor,
                      fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
              ],
            )
          )
      ],
    );
  }
}
