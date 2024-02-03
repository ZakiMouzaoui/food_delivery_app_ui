import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_button.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:food_delivery_app_ui/controllers/order_controller.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:food_delivery_app_ui/screens/orders/order_item_widget.dart';
import 'package:food_delivery_app_ui/screens/orders/price_info_row.dart';
import 'package:food_delivery_app_ui/screens/orders/restaurant_widget.dart';
import 'package:food_delivery_app_ui/utils/restaurants.dart';
import 'package:food_delivery_app_ui/utils/show_dialog.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key});

  final ctr = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: const CustomAppBar(
                  title: "My Orders",
                  hasReturnBtn: true,
                  hasCart: false,
                )),

            Obx(() => ctr.foodItems.isNotEmpty
                ? Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            RestaurantCardWidget(restaurant: restaurants[0]),
                            SizedBox(
                              height: 30.h,
                            ),
                            Obx(
                                  () => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                color: AppColors.textFieldColor,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (_, index) => Dismissible(
                                      key: Key("$index ${ctr.foodItems[index].name}"),
                                      confirmDismiss: (DismissDirection direction) async{
                                        if(direction.name == "endToStart"){
                                          ctr.removeItem(index);
                                        }
                                        else{
                                          showEditItemDialog(context, index, ctr.foodItems[index].qty);
                                        }
                                        return null;
                                      },
                                      background: const Align(alignment: Alignment.topLeft, child: Icon(Icons.edit, color: Colors.blue,)),
                                      secondaryBackground: const Align(alignment: Alignment.topRight, child: Icon(Icons.delete, color: Colors.red,)),
                                      child: OrderItemWidget(
                                          item: ctr.foodItems[index])),
                                  separatorBuilder: (_, __) => Container(
                                    padding: EdgeInsets.symmetric(vertical: 15.h),
                                    child: const Divider(
                                      height: 0.5,
                                      color: AppColors.placeholderColor,
                                    ),
                                  ),
                                  itemCount: ctr.foodItems.length,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Instructions",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "+ Add Notes",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                child: const Divider(
                                  color: AppColors.placeholderColor,
                                )),
                            PriceInfoRow(
                                info: "Sub Total", price: ctr.subTotal.value),
                            SizedBox(
                              height: 10.h,
                            ),
                            PriceInfoRow(
                                info: "Delivery Cost",
                                price: ctr.deliveryCost),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                child: const Divider(
                                  color: AppColors.placeholderColor,
                                )),
                            PriceInfoRow(
                              info: "Total",
                              price: ctr.deliveryCost + ctr.subTotal.value,
                              fontSize: 16.sp,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                      Expanded(flex: 1, child: // BUTTONS

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                CustomButton(onPressed: () {
                                  Get.toNamed(AppRoutes.checkout);
                                }, title: "Checkout"),
                                SizedBox(height: 10.h,),
                                CustomButton(onPressed: (){ctr.clearCart();}, title: "Clear Cart", isOutlined: true,)
                              ],
                            ),
                          ))
                    ],
                  ),
                )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150.h,
                        ),
                        Image.asset(
                          "assets/images/empty-cart.webp",
                          width: 200.w,
                        ),
                        CustomButton(
                            onPressed: () {
                              Get.offAllNamed(AppRoutes.home);
                            },
                            title: "Order Now")
                      ],
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
