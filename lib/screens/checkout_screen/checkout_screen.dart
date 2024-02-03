import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:food_delivery_app_ui/screens/checkout_screen/payment_method_container.dart';
import 'package:food_delivery_app_ui/screens/orders/price_info_row.dart';
import 'package:food_delivery_app_ui/utils/show_dialog.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: const CustomAppBar(
                  title: "Checkout",
                  hasReturnBtn: true,
                  hasCart: false,
                )),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Address",
                    style: TextStyle(
                        color: AppColors.primaryTextColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hai El Sabah, Oran",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.changeAddress);
                        },
                        child: const Text(
                          "Change",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 15.h,
              width: double.infinity,
              color: AppColors.textFieldColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment Method",
                        style: TextStyle(
                            color: AppColors.primaryTextColor.withOpacity(0.7),
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: (){
                          showAddCardDialog(context);
                        },
                        child: const Text(
                          "+ Add Card",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  PaymentMethodContainer(
                      index: 0,
                      prefix: const Text(
                    "Cach on delivery",
                    style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w600),
                  )),
                  SizedBox(
                    height: 15.h,
                  ),
                  PaymentMethodContainer(
                      index: 1,
                      prefix: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Image.asset(
                            "assets/images/visa_icon.png",
                            height: 20.h,
                          )),
                      const Text(
                        "**** **** **** 2187 ",
                        style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 15.h,
                  ),
                  PaymentMethodContainer(
                    index: 2,
                      prefix: Row(
                    children: [
                      Image.asset(
                        "assets/images/paypal.png",
                        height: 20.h,
                      ),
                      const Text(
                        "zaki@gmail.com",
                        style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              height: 15.h,
              width: double.infinity,
              color: AppColors.textFieldColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            const PriceInfoRow(info: "Sub Total", price: 2000),
            SizedBox(
              height: 10.h,
            ),
            const PriceInfoRow(info: "Delivery Cost", price: 300),
            SizedBox(
              height: 10.h,
            ),
            const PriceInfoRow(info: "Discount", price: -100),
            const Divider(
              color: AppColors.textFieldColor,
            ),
            const PriceInfoRow(info: "Total", price: 2400),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 15.h,
              width: double.infinity,
              color: AppColors.textFieldColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                  onPressed: () {
                    showThanksDialog(context);
                  },
                  title: "Send Order"),
            )
          ],
        ),
      ),
    );
  }
}
