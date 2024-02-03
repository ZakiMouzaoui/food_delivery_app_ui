import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DoubleBack(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                alignment: Alignment.center,

                children: [
                  Image.asset(
                    "assets/images/welcome_top_shape.png",

                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: size.height*0.21,

                    child:Image.asset(
                      "assets/images/app_logo.png",
                      width: size.width * 0.55,
                      height: size.height * 0.55,
                      fit: BoxFit.contain,

                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Text("Discover the best foods from over 1000 restaurants and fast delivery to your doorstep", style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.secondaryTextColor
                ), textAlign: TextAlign.center,),
              ),
              SizedBox(height: 40.h,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 26.w), child: CustomButton(onPressed: (){
                Navigator.pushNamed(context, AppRoutes.login);
              },  title: "Login")),
              SizedBox(height: 15.h,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 26.w), child: CustomButton(isOutlined: true, onPressed: (){
                Navigator.pushNamed(context, AppRoutes.signUp);
              },  title: "Create an account"))

            ],
          )

        ),
      ),
    );
  }
}
