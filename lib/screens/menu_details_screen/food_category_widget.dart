import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/models/food_model.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:get/get.dart';

class FoodCategoryWidget extends StatelessWidget {
  const FoodCategoryWidget(
      {super.key, required this.foodModel, required this.category});

  final FoodModel foodModel;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.foodDetails, arguments: {"food": foodModel});
      },
      child: Stack(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      foodModel.image,
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            height: 200.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black54, Colors.black12],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  foodModel.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primaryColor,
                    ),
                    const Text(
                      "4.9",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      category,
                      style: const TextStyle(color: AppColors.textFieldColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
