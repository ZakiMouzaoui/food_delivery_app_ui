import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/profile_controller.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/auth_repository.dart';
import 'package:food_delivery_app_ui/utils/theme.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController ctr = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ListView(
        shrinkWrap: true,
        children: [
          const CustomAppBar(title: "Profile"),
          SizedBox(height: 10.h,),
          Obx(()=>CircleAvatar(
            backgroundImage: ctr.imgPath.isNotEmpty ? FileImage(File(ctr.imgPath.value)) : const AssetImage("assets/images/default-avatar.jpg") as ImageProvider,
            radius: 70.r,
            backgroundColor: AppColors.primaryColor.withOpacity(0.5),

          )),
          TextButton(
              onPressed: () async {
                await ctr.pickImage();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.edit,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Text(
                    "Edit",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              )),
          Text(
            "Hi there Zaki!",
            style: TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
            textAlign: TextAlign.center,
          ),
          InkWell(
              onTap: (){
                ctr.signOut();
              },
              child: Text(
                "Sign out",
                style: AppTheme.textTheme.titleSmall,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            hint: "Name",
            controller: ctr.nameCtr,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            hint: "Email",
            controller: ctr.emailCtr,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            hint: "Mobile No",
            controller: ctr.phoneCtr,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            hint: "Address",
            controller: ctr.addressCtr,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            hint: "Password",
            controller: ctr.pwdCtr,
            isObscure: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(onPressed: () {}, title: "Save"),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }
}
