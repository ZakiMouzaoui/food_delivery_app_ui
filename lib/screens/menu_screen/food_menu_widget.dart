import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/models/food_category_model.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:get/get.dart';


class FoodMenuWidget extends StatelessWidget {
  const FoodMenuWidget({super.key, required this.category});

  final FoodCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.toNamed(AppRoutes.menuDetails, arguments: {"menu": category}),
      child: Stack(
        alignment: Alignment.center,
        children: [

          Container(
            padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 20.h),
            width: double.infinity,
            margin: EdgeInsets.only(left: 40.w, right: 30.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), bottomLeft: Radius.circular(40.r), topRight: Radius.circular(10.r), bottomRight: Radius.circular(10.r)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5,5),
                  color: AppColors.placeholderColor.withOpacity(0.2),
                  blurRadius: 15
                ),
                BoxShadow(
                    offset: const Offset(-2,-5),
                    color: AppColors.placeholderColor.withOpacity(0.2),
                    blurRadius: 15
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                    fontSize: 16.sp
                ),),
                Text("${category.totalItems} items", style: TextStyle(
                  color: AppColors.placeholderColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600
                ),)
              ],
            )
          ),
          Positioned(
            left: 20.w,
            child: Container(
              width: 65.w,
              height: 65.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(category.image),
                  fit: BoxFit.cover
                )
              ),
            ),

          ),
          Positioned(
            right: 20.w,
            child: Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5,5),
                      color: AppColors.placeholderColor.withOpacity(0.2),
                      blurRadius: 15
                  ),
                  BoxShadow(
                      offset: const Offset(-2,-5),
                      color: AppColors.placeholderColor.withOpacity(0.2),
                      blurRadius: 15
                  )
                ]
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor,),
            ),

          )
        ],
      ),
    );
  }
}
