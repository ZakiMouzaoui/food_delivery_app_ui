import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/models/food_model.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          //fit: StackFit.expand,
          children: [
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(foodModel.image),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: 400.h,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black45,
                Colors.black12,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){Get.back();},
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.myOrders);
                    },
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height / 3.1,
              height: MediaQuery.of(context).size.height,
              width: size.width,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodModel.name,
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                              ),
                              Icon(
                                Icons.star_outline_rounded,
                                color: AppColors.primaryColor,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "4 stars rating",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${foodModel.price} DA",
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            foodModel.description,
                            style: TextStyle(
                                color:
                                    AppColors.primaryTextColor.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                width: 60.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 60.w,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: AppColors.primaryColor, width: 1.2)),
                                child: const Text(
                                  "2",
                                  style:
                                      TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 60.w,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: 200.h,
                          width: size.width / 3.5,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.r),
                                bottomRight: Radius.circular(40.r)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 70.w, vertical: 20.h),
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 60.w, right: 30.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.r),
                                  bottomLeft: Radius.circular(40.r),
                                  topRight: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r)),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(5, 5),
                                    color: AppColors.placeholderColor
                                        .withOpacity(0.2),
                                    blurRadius: 15),
                                BoxShadow(
                                    offset: const Offset(-2, -5),
                                    color: AppColors.placeholderColor
                                        .withOpacity(0.2),
                                    blurRadius: 15)
                              ]),
                          child: Column(
                            children: [
                              const Text(
                                'Total Price',
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "400 DA",
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomButton(
                                onPressed: () {},
                                height: 40.h,
                                fontSize: 12.sp,
                                title: "Add to Cart",
                                icon: const Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
