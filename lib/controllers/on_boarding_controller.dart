import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app_ui/controllers/main_controller.dart';
import 'package:food_delivery_app_ui/controllers/splash_controller.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  Rx<int> currentPage = 0.obs;
  final PageController controller = PageController();
  final mainCtr = Get.find<MainController>();

  void goToNextPage (index){
    currentPage.value = index;
  }

  void navigateToHome(){
    mainCtr.setOnboardingShown();
    Get.find<SplashController>().navigateBasedOnAuth();
  }
}