import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';


class PopularFood extends StatelessWidget {
  const PopularFood({super.key, required this.image, required this.title, required this.rating, this.isLiked=false});

  final String image;
  final String title;
  final double rating;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: 150.h,
                width: 220.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              Container(
                height: 150.h,
                width: 220.w,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: Colors.black54.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: (){}, child: const Icon(Icons.shopping_cart_outlined, color: Colors.white,)),
                    InkWell(onTap: (){}, child: Icon(isLiked ? Icons.favorite : Icons.favorite_border_rounded, color: Colors.red,))
                  ],
                ),
              )
            ]
          ),
          SizedBox(height: 10.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.primaryTextColor, fontSize: 14.sp),),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: AppColors.primaryColor,size: 14.sp,),
                  Text("$rating", style: const TextStyle(
                      color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold
                  ),),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
