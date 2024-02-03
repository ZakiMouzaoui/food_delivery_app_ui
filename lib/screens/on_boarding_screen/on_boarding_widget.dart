import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery_app_ui/controllers/on_boarding_controller.dart";
import "package:get/get.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "../../constants/colors.dart";

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle});

  final String img;
  final String title;
  final String subtitle;

  final OnBoardingController onBoardingCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [

            Image.asset(img, width: size.width * 0.6, height: size.height*0.4),


            Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: onBoardingCtr.currentPage.value,
                count: 3,
                effect: SlideEffect(
                    dotWidth: 10.w,
                    dotHeight: 10.h,
                    spacing: 8.0,
                    dotColor: AppColors.placeholderColor,
                    activeDotColor: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 28.sp,
                  letterSpacing: 0.01),
            ),
            SizedBox(
              height: 33.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                subtitle,
                style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Metropolis",
                    letterSpacing: 0.01),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),

          ],
        ),
      ],
    );
  }
}
