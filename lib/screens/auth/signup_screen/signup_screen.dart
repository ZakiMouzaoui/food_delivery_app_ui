import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/sign_up_controller.dart';
import 'package:food_delivery_app_ui/utils/theme.dart';
import 'package:food_delivery_app_ui/utils/validations/sign_up_validation.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(SignUpController());

    final formKey = GlobalKey<FormState>();

    return SafeArea(child: Scaffold(
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
                Text("Sign Up", style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.primaryTextColor
                ),),
                SizedBox(height: 15.h,),
                Text("Add your details to sign up", style: AppTheme.textTheme.titleSmall),
                SizedBox(height: 28.h,),
                CustomTextField(hint: "Name", controller: ctr.nameCtr, validator: SignupValidation.validateName,),
                SizedBox(height: 28.h,),
                CustomTextField(hint: "Email", controller: ctr.emailCtr, validator: SignupValidation.validateEmail, keyboardType: TextInputType.emailAddress,),
                SizedBox(height: 28.h,),
                CustomTextField(hint: "Mobile No", controller: ctr.mobileCtr, validator: SignupValidation.validatePhoneNumber, keyboardType: TextInputType.number,),
                SizedBox(height: 28.h,),
                CustomTextField(hint: "Address", keyboardType: TextInputType.streetAddress, validator: SignupValidation.validateAddress, controller: ctr.addressCtr,),
                SizedBox(height: 28.h,),
                CustomTextField(hint: "Password", isObscure: true, controller: ctr.pwd1Ctr, validator: SignupValidation.validatePassword,),
                SizedBox(height: 28.h,),
                CustomTextField(hint: "Confirm Password", isObscure: true, validator: ctr.validatePasswordMatch, controller: ctr.pwd2Ctr,),
                SizedBox(height: 28.h,),
                CustomButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    /*
                    ctr.verifyPhone();
                    Get.toNamed(AppRoutes.otp, arguments: {
                      "phoneNumber": ctr.mobileCtr.text
                    });
                     */
                    ctr.signUp();
                  }
                }, title: "Sign Up"),
                SizedBox(height: 28.h,),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Already have an account?", style: AppTheme.textTheme.titleSmall,),

                  TextButton(style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)))
                  ), onPressed: (){
                    Get.toNamed(AppRoutes.login);
                  }, child: Text("Login", style: AppTheme.textTheme.titleSmall?.copyWith(color: AppColors.primaryColor)))
                ],)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
