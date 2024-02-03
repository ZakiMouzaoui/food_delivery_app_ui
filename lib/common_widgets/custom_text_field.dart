import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.isObscure = false, this.controller, this.validator, this.keyboardType=TextInputType.text, this.prefixIcon, this.hasLabel=true, this.width});

  final String hint;
  final bool isObscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool hasLabel;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      child: TextFormField(
        key: Key(hint),
          decoration: InputDecoration(
              hintText: hint,
              errorMaxLines: 3,
              hintStyle: const TextStyle(color: AppColors.placeholderColor),
              alignLabelWithHint: true,
              filled: true,
              fillColor: AppColors.textFieldColor,
              labelStyle: const TextStyle(
                color: AppColors.placeholderColor,
                fontWeight: FontWeight.w500,
              ),
              //floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: hasLabel ? hint : null,
              floatingLabelStyle: const TextStyle(color: AppColors.primaryTextColor, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40.r)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(40.r),
      
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(40.r),
              ),
              prefixIcon: prefixIcon != null ? Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Icon(prefixIcon, size: 30, color: AppColors.placeholderColor,)) : null,
              isDense: true,
              //floatingLabelAlignment: FloatingLabelAlignment.center,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)),
          obscureText: isObscure,
          validator: validator ,
          keyboardType: keyboardType,
          controller: controller,
        //textAlign: TextAlign.center,
      ),
    );
  }
}
