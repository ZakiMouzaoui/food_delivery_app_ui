import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';


class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.title, required this.image, this.count, this.onTap});
  final String title;
  final String image;
  final int? count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
         margin: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
            color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 15.h, bottom: 15.h, right: 35.w),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.placeholderColor.withOpacity(0.7),

                      ),
                      height: 53.h,
                      width: 53.w,
                      child: Image.asset(image),
                    ),
                    SizedBox(width: 15.w,),
                    Text(title, style: TextStyle(
                        color: AppColors.primaryTextColor.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp
                    ),),
                    const Spacer(),
                    count != null ? Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Text("$count", style: const TextStyle(
                          color: Colors.white
                      ),),
                    ) : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textFieldColor
              ),
              child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryTextColor.withOpacity(0.7)),
            ),
          ),
      ],
    );
  }
}
