import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/inbox_controller.dart';
import 'package:food_delivery_app_ui/controllers/order_controller.dart';
import 'package:food_delivery_app_ui/models/inbox_model.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:get/get.dart';

void showDetailsDialog(context, InboxModel model) {
  final ctr = Get.find<InboxController>();

  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          showDeleteDialog(context, model);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    InkWell(
                        onTap: () {
                          ctr.toggleFavorites(model.id);
                        },
                        child: Obx(() => Icon(
                              ctr.favorites.contains(model.id)
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: AppColors.primaryColor,
                            )))
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.5),
                  child: Text(
                    model.object,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(model.content),
              ],
            ),
          ));
}

void showDeleteDialog(context, InboxModel model, {bool? secondDialog = true}) {
  final ctr = Get.find<InboxController>();

  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(
              "Are you sure you want to delete this message?",
              style: TextStyle(fontSize: 16.sp),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black54),
                  )),
              TextButton(
                  onPressed: () {
                    ctr.removeMessage(model);
                    Navigator.of(context).pop();
                    if (secondDialog == true) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Confirm",
                      style: TextStyle(color: Colors.red)))
            ],
          ));
}

void showEditItemDialog(context, int index, int qty) {
  final ctr = Get.find<OrderController>();

  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(
              "Select a quantity",
              style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 50.w,
                  height: 30.h,
                  child: DropdownButton(
                    value: qty,
                    icon: Padding(
                        padding: EdgeInsets.only(left: 8.5.w),
                        child: const Icon(Icons.arrow_drop_down)),
                    items: List.generate(
                        10,
                        (index) => DropdownMenuItem<int>(
                            value: index + 1, child: Text('${index + 1}'))),
                    onChanged: (int? value) {
                      ctr.updateQty(index, value!);
                      Navigator.pop(context);
                    },
                  ),
                ),

                /*
                IconButton(
                    onPressed: () {
                      ctr.increaseQty(index, true);
                    },
                    icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.primaryTextColor, width: 2)),
                        child: const Icon(Icons.add)))
                */
              ],
            ),
          ));
}

void showThanksDialog(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.primaryTextColor,
                          ),
                        )),
                    Image.asset(
                      "assets/images/thank_you.png",
                      height: 200.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Thank You!",
                      style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "for your order",
                      style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Your order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryTextColor.withOpacity(.6),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(onPressed: () {}, title: "Track my order"),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.home);
                        },
                        child: Text(
                          "Back to home",
                          style: TextStyle(
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp),
                        ))
                  ],
                ),
              ),
            ],
          ));
}

void showAddCardDialog(context) {
  showFlexibleBottomSheet(
      context: context,
      //isScrollControlled: true,
      //enableDrag: true,
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 0.82,
      anchors: [0, 0.5, 0.82],
      bottomSheetBorderRadius: BorderRadius.only(topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
      isSafeArea: true,
        builder: (_, ctr, __) => ListView(
          controller: ctr,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.primaryTextColor,
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Add Credit Card",
                      style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),
                    Divider(
                      color: AppColors.placeholderColor.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const CustomTextField(hint: "Card Number"),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Expiry",
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                        ),
                        Expanded(flex: 2, child: Row(
                          children: [
                            const Expanded(child: CustomTextField(hint: "MM")),
                            SizedBox(width: 10.w,),
                            const Expanded(child: CustomTextField(hint: "YY"))
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    const CustomTextField(hint: "Security Code"),
                    SizedBox(height: 20.h,),
                    const CustomTextField(hint: "First Name"),
                    SizedBox(height: 20.h,),
                    const CustomTextField(hint: "Last Name"),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text("You can remove this card at anytime", style: TextStyle(
                            color: AppColors.primaryTextColor.withOpacity(0.7),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp
                          ),),
                        ),
                        Switch(value: true, onChanged: (val){})
                      ],
                    ),
                    SizedBox(height: 40.h,),
                    CustomButton(onPressed: (){
                      Navigator.pop(context);
                    }, title: "Add Card")
                  ],
                ),
              ),
            ],
          ));
}
