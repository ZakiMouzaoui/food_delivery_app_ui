import 'package:food_delivery_app_ui/controllers/main_controller.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/auth_repository.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  final _authService = Get.find<AuthRepository>();
  final _mainCtr = Get.find<MainController>();

  void navigateBasedOnAuth(){
    if(_authService.firebaseUser.value == null){
      Get.offAllNamed(AppRoutes.welcome);
    }
    else{
      Get.offAllNamed(AppRoutes.home);
    }
  }

  void navigateToHome(){
    if(!_mainCtr.onboardingShown){
      Get.offAllNamed(AppRoutes.onBoarding);
    }
    else{
      navigateBasedOnAuth();
    }
  }
}