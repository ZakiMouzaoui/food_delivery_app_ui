import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../constants/colors.dart';
import '../../../utils/theme.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Reset Password", style: TextStyle(
                  fontSize: 30.sp,
                  color: AppColors.primaryTextColor
              ),),
              SizedBox(height: 15.h,),
              Text("Please enter your email to receive a link to create a new password via email", textAlign: TextAlign.center, style: AppTheme.textTheme.titleSmall),
              SizedBox(height: 58.h,),

              const CustomTextField(hint: "Email"),
              SizedBox(height: 28.h,),

              CustomButton(onPressed: (){}, title: "Send"),
              SizedBox(height: 28.h,),


            ],
          ),
        ),
      ),
    ));
  }
}
