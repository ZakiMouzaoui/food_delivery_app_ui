import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';


class PriceInfoRow extends StatelessWidget {
  const PriceInfoRow({super.key, required this.info, required this.price, this.fontSize});

  final String info;
  final int price;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(info, style: const TextStyle(fontWeight: FontWeight.bold),),
          Text("$price DA", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: fontSize ?? 13.sp),)
        ],
      ),
    );
  }
}
