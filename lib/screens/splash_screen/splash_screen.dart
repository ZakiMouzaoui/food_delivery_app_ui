import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    animateToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            const Image(image: AssetImage("assets/images/splash_bg.png"),),
            Positioned(child: Container(
              alignment: Alignment.center,
              child: Image(image: const AssetImage("assets/images/app_logo.png"), fit: BoxFit.cover, width: 280.w,),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> animateToNextPage ()async{
    await Future.delayed(const Duration(milliseconds: 500));
    /*
    if(ctr.onboardingShown){
      Get.offNamed(AppRoutes.welcome);
    }
    else{
      Get.offNamed(AppRoutes.onBoarding);
    }
     */
    Get.put(SplashController()).navigateToHome();
  }
}

