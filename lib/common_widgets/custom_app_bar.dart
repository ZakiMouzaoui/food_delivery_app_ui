import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/utils/theme.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, this.hasReturnBtn = false, this.hasCart=true});

  final String title;
  final bool hasReturnBtn;
  final bool hasCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          hasReturnBtn
              ? GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.primaryTextColor,
                    ),
                  ))
              : const SizedBox.shrink(),
          Text(
            title,
            style: AppTheme.textTheme.displayMedium,
          )
        ]),
        hasCart ? GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.myOrders);
          },
          child: const Icon(
            Icons.shopping_cart_rounded,
            color: AppColors.primaryTextColor,
          ),
        ) : const SizedBox.shrink()
      ],
    );
  }
}
