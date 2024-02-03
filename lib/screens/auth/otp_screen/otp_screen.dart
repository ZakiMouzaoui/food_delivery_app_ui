import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/controllers/otp_controller.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../constants/colors.dart';
import '../../../utils/theme.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key, required this.phoneNumber});

  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  final String phoneNumber;
  final otpCtr = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    String otp = "";

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "We have sent an OTP to your mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.sp, color: AppColors.primaryTextColor),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                  "Please check your mobile number ${maskPhone(phoneNumber)} continue to reset your password",
                  textAlign: TextAlign.center,
                  style: AppTheme.textTheme.titleSmall),
              SizedBox(
                height: 58.h,
              ),

              // OTP FIELD
              OtpPinField(
                key: _otpPinFieldController,
                autoFillEnable: false,
                textInputAction: TextInputAction.done,
                onSubmit: (code) {
                  otp = code;
                  otpCtr.verifyOtp(code);
                },

                otpPinFieldStyle: const OtpPinFieldStyle(
                  defaultFieldBorderColor: AppColors.textFieldColor,
                  activeFieldBorderColor: AppColors.primaryColor,
                  defaultFieldBackgroundColor: AppColors.textFieldColor,
                  activeFieldBackgroundColor: AppColors.textFieldColor,
                  filledFieldBackgroundColor: AppColors.textFieldColor,
                  filledFieldBorderColor: AppColors.textFieldColor,
                  fieldBorderRadius: 10,

                ),
                maxLength: 4,
                showCursor: true,
                cursorColor: AppColors.primaryColor,
                upperChild: const SizedBox.shrink(),
                showDefaultKeyboard: true,
                cursorWidth: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                autoFocus: true,
                fieldHeight: 58.h,
                fieldWidth: 58.w, onChange: (String text) {  },
              ),
              SizedBox(
                height: 28.h,
              ),

              CustomButton(onPressed: () {
                otpCtr.verifyOtp(otp);
              }, title: "Next"),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive?",
                    style: AppTheme.textTheme.titleSmall,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 0),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      child: Text("Click Here",
                          style: AppTheme.textTheme.titleSmall
                              ?.copyWith(color: AppColors.primaryColor)))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

String maskPhone(String input) {
  String firstTwo = input.substring(0, 4);
  String lastTwo = input.substring(input.length - 2);
  String mask = '*' * (input.length - 6);
  String result = firstTwo + mask + lastTwo;

  return result;
}
