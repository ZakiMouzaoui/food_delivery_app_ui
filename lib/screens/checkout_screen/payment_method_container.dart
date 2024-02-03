import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/checkout_controller.dart';
import 'package:get/get.dart';


class PaymentMethodContainer extends StatelessWidget {
  PaymentMethodContainer({super.key, required this.prefix, required this.index});

  final Widget prefix;
  final int index;

  final ctr = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ctr.changeIdx(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: AppColors.placeholderColor.withOpacity(0.1))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefix,
            /*
            Container(
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor)
              ),
            )
             */
            Obx(
              ()=> SizedBox(
                width: 28.w,
                height: 30.h,
                child: RadioMenuButton(value: index, groupValue: ctr.selectedIdx.value, onChanged: (value){
                  ctr.changeIdx(value!);
                }, style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(AppColors.primaryColor),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  splashFactory: NoSplash.splashFactory,

                ), child: const SizedBox.shrink()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
