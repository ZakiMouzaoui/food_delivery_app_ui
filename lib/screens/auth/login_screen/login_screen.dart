import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/login_controller.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:food_delivery_app_ui/utils/theme.dart';
import 'package:food_delivery_app_ui/utils/validations/login_validation.dart';
import 'package:food_delivery_app_ui/utils/validations/sign_up_validation.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ctr = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24.w),
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 30.sp, color: AppColors.primaryTextColor),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text("Add your details to login",
                    style: AppTheme.textTheme.titleSmall),
                SizedBox(
                  height: 28.h,
                ),
                CustomTextField(hint: "Email", keyboardType: TextInputType.emailAddress, validator: SignupValidation.validateEmail, controller: ctr.emailCtr),
                SizedBox(
                  height: 28.h,
                ),
                CustomTextField(
                  hint: "Password",
                  isObscure: true,
                  controller: ctr.pwdCtr,
                  validator: LoginValidation.validatePassword,
                ),
                SizedBox(
                  height: 28.h,
                ),
                CustomButton(onPressed: ()async {
                  if(formKey.currentState!.validate()){
                    await ctr.login();
                  }
                }, title: "Login"),
                SizedBox(
                  height: 28.h,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.forgotPassword);
                    },
                    child: Text(
                      "Forgot your password?",
                      style: AppTheme.textTheme.titleSmall,
                    )),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "or Login With",
                  style: AppTheme.textTheme.titleSmall,
                ),
                SizedBox(
                  height: 28.h,
                ),
                CustomButton(
                    onPressed: () {},
                    title: "Login with Facebook",
                    backgroundClr: const Color(0xff367FC0),
                    icon: const Icon(
                      Icons.facebook,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 28.h,
                ),
                CustomButton(
                    onPressed: () {},
                    title: "Login with Google",
                    backgroundClr: const Color(0xffDD4B39),
                    icon: Image.asset(
                      "assets/images/google_logo.png",
                      width: 30,
                    )),
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppTheme.textTheme.titleSmall,
                    ),

                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signUp);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                            shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(20)))
                        ),
                        child: Text("Sign up",
                            style: AppTheme.textTheme.titleSmall
                                ?.copyWith(color: AppColors.primaryColor)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
