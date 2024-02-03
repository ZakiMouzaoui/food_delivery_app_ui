import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, this.icon, required this.title, this.isOutlined=false, this.backgroundClr=AppColors.primaryColor, this.width, this.height, this.fontSize});

  final VoidCallback onPressed;
  final Widget? icon;
  final String title;
  final bool isOutlined;
  final Color backgroundClr;
  final double? width;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return isOutlined == false ? SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(onPressed: onPressed, style: ElevatedButton.styleFrom(
        backgroundColor: backgroundClr,
        padding: EdgeInsets.symmetric(vertical: 12.h)
      ), child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon != null ? Padding(padding: EdgeInsets.symmetric(horizontal: 10.w), child:  icon) : const SizedBox.shrink(),
          Text(title, style: TextStyle(color: Colors.white, fontSize: fontSize ?? 16.sp),)
        ],
      )),
    ) : SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(onPressed: onPressed, style: OutlinedButton.styleFrom(
        foregroundColor: backgroundClr,
          side: BorderSide(color: backgroundClr),
          padding: EdgeInsets.symmetric(vertical: 12.h)
      ), child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? Padding(padding: EdgeInsets.symmetric(horizontal: 10.w), child: icon) : const SizedBox.shrink(),
          Text(title, style: TextStyle(color: backgroundClr, fontSize: fontSize ?? 16.sp),)
        ],
      )),
    );
  }
}
