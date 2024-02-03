import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/controllers/on_boarding_controller.dart';
import 'package:food_delivery_app_ui/models/on_boarding_model.dart';
import 'package:food_delivery_app_ui/screens/on_boarding_screen/on_boarding_widget.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_button.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  final OnBoardingController ctr = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final models = [
      const OnBoardingModel(
          title: "Find Food You Love",
          subtitle:
              "Discover the best foods from over 1000 Restaurants and fast delivery to your doorstep",
          img: "assets/images/on_boarding_1.png"),
      const OnBoardingModel(
          title: "Fast Delivery",
          subtitle: "Fast food delivery to your home, office wherever you are",
          img: "assets/images/on_boarding_2.png"),
      const OnBoardingModel(
          title: "Live Tracking",
          subtitle:
              "Real time tracking of your food on the app once you placed the order",
          img: "assets/images/on_boarding_3.png")
    ];

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          width: size.width,
          child: Stack(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                      height: size.height * 0.72,
                      child: PageView.builder(
                        controller: ctr.controller,
                        itemCount: 3,
                        itemBuilder: (_, index) => OnBoardingWidget(
                          img: models[index].img,
                          title: models[index].title,
                          subtitle: models[index].subtitle,
                        ),
                        onPageChanged: (index) {
                          ctr.goToNextPage(index);
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Obx(
                      ()=> CustomButton(
                          onPressed: () {
                            ctr.currentPage.value != 2
                                ? ctr.controller
                                    .jumpToPage(ctr.currentPage.value + 1)
                                : ctr.navigateToHome();
                          },
                          title: ctr.currentPage.value < 2 ? "Next" : "Get Started"),
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 0,
                  child: TextButton(
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontFamily: "metropolis", fontSize: 15.sp),
                      ),
                      onPressed: () {
                        ctr.navigateToHome();
                      }))
            ],
          )),
    ));
  }
}
